" Begin Vundle configuration

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Put all your Vundle plugins here. All of these are hosted on github
Plugin 'Auto-Pairs'
Plugin 'tpope/vim-unimpaired'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'KevinGoodsell/vim-csexact'
Plugin 'flazz/vim-colorschemes'
Plugin 'wincent/command-t'
call vundle#end()            " required
filetype plugin indent on    " required

" End Vundle configuration
" This is all of my customization

" Some javascript linting stuff. Requires eslint_d is installed.
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
colorscheme wombat
set completeopt-=preview "disable annoying preview window YouCompleteMe opens all the time"
set clipboard=unnamedplus " To allow copy/paste from system register using (ignore single quotes) '"*y' and '"*p"'
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 " set javascript to 2 spaces
