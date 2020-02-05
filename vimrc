filetype off
" execute pathogen#infect()

let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
set tags=./tags;

vnoremap < <gv
vnoremap > >gv

" Smart Indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

syn on
set et

set background=dark
 let g:solarized_termcolors=16
" let g:solarized_diffmode="high"
" let g:solarized_contrast = "high"
" let g:solarized_visibility = "high"
 let g:solarized_termtrans = 1
colorscheme solarized

set ruler
set number
set modeline

filetype plugin indent on
syntax on
set nocompatible
set t_Co=256
set showmode
set encoding=utf-8
set autoindent
set backspace=indent,eol,start

let mapleader = ","

" Set up puppet manifest and spec options
au BufRead,BufNewFile *.pp
  \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>

" Enable indentation matching for =>'s
filetype plugin indent on

" Make /-style searches case-sensitive only if there is a capital letter in
" " the search expression. *-style searches continue to be consistently
" " case-sensitive.
set ignorecase
set smartcase

set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

set wrap
set textwidth=79
set formatoptions=qrn1

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

map Q gqap
map <F2> :NERDTreeToggle<CR>

" Smart w!! incase you open a read-only file...
cmap w!! w !sudo tee % > /dev/null

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1

" A little longer history
set history=1000

" Replace insert pry breakpoint in insert mode
imap !!p require 'pry' ; binding.pry

" Clipboard setting
set clipboard=unnamed
