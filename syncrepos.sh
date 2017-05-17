#!/bin/bash
# This tool can be used to sync down Red Hat based packages from RHN using only Red Hat shipped tools
# Brian "Red Beard" Harrington <brian@dead-city.org>
# To satisfy the pre-reqs for this script install the following two rpms:
# yum-utils
# createrepo

download_dir="/var/www/html/RHN"

/usr/bin/reposync --gpgcheck -m --download-metadata -l -p ${download_dir}/ >> /var/log/reposync.log 2>&1

for dirname in `find ${download_dir} -maxdepth 1 -mindepth 1 -type d`; do
  echo $dirname: | tee -a /var/log/reposync.log
	if [ -f "${dirname}/comps.xml" ]; then
		cp ${dirname}/comps.xml ${dirname}/Packages/ >> /var/log/reposync.log 2>&1
		createrepo  --update -p --workers 2 -g ${dirname}/Packages/comps.xml ${dirname} >> /var/log/reposync.log 2>&1
	else
		createrepo  --update -p --workers 2 ${dirname}/ >> /var/log/reposync.log 2>&1
	fi	
	set -o pipefail 
	updateinfo=$(ls -1t  ${dirname}/*-updateinfo.xml.gz 2>/dev/null | head -1 ) 
	if [[ -f $updateinfo  &&  $? -eq 0 ]]; then
		echo "Updating errata information for ${dirname}" >> /var/log/reposync.log 2>&1
		\cp $updateinfo ${dirname}/updateinfo.xml.gz  >> /var/log/reposync.log 2>&1
		gunzip -df ${dirname}/updateinfo.xml.gz  >> /var/log/reposync.log 2>&1
		modifyrepo ${dirname}/updateinfo.xml ${dirname}/repodata/  >> /var/log/reposync.log 2>&1
	else
		echo "No errata information to be processed for ${dirname}" >> /var/log/reposync.log 2>&1
	fi
done