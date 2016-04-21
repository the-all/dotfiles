execute pathogen#infect()
filetype off
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

set nocompatible
set modelines=0
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set visualbell
set ttyfast
set cursorline
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

set colorcolumn=85
let mapleader=","
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> : noh<cr>
set wrap
set textwidth=79
set formatoptions=qrn1
nnoremap j gj
nnoremap k gk
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
