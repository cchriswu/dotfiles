set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

set nocompatible
set nohlsearch
syntax on
set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set hidden
set ignorecase
set smartcase
set incsearch
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
set noerrorbells visualbell t_vb=
set mouse+=a

" Share MacOS clipboard.
set clipboard=unnamed

" vim-plug
call plug#begin('~/.vim/plugged')

" Plug 'ntpeters/vim-better-whitespace'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'

" Syntactic language support
" Plug 'stephpy/vim-yaml'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'godlygeek/tabular'
" Plug 'cjuniet/clang-format.vim'

" Lint tools
" Plug 'prettier/vim-prettier'

" Git integration
" Plug 'airblade/vim-gitgutter'
" Plug 'APZelos/blamer.nvim'

" Colorscheme
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'

call plug#end()

colorscheme tokyonight
let g:lightline = { 'colorscheme': 'tokyonight' }
