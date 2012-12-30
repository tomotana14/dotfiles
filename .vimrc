set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

filetype plugin indent on
filetype indent on
syntax on

set autoindent
set ignorecase
set smartcase
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noswapfile
set clipboard=unnamed,autoselect
set completeopt=menuone
set ruler
set showmatch
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
