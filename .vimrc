call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs' " autocomplete matching quotes and paren
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' } " Sweet autocompletion. To install: cd ~/.vim/bundle/YouCompleteMe && ./install.py --all
Plug 'pangloss/vim-javascript' " javascript syntax and indentation
let g:javascript_plugin_jsdoc = 1
Plug 'heavenshell/vim-jsdoc' " automatically generate JSDocs
" Using ctrl-l
nmap <silent> <C-l> <Plug>(jsdoc)
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_param_description_separator = ' - '
Plug 'flazz/vim-colorschemes' " lots of colorschemes
set termguicolors
set background=dark
Plug 'ctrlpvim/ctrlp.vim' " it seems likes this is more commonly used than command-t
let g:ctrlp_map = '<c-p>' " actually open ctrlp with <c-p>
Plug 'tpope/vim-surround' " Makes it easy to modify matching brackets
Plug 'vim-airline/vim-airline' " cool status bar
set laststatus=2 " airline status bar always on
Plug 'tpope/vim-commentary' " Allow quick commenting of lines
Plug 'tpope/vim-repeat' " integrates . command with plugin commands
Plug 'airblade/vim-gitgutter' " Vim git gutter
Plug 'artur-shaik/vim-javacomplete2' " Java autocomplete
Plug 'tpope/vim-unimpaired' " Some useful key bindings
" Plug 'justinmk/vim-sneak' " This looks useful for when I actually become good at using vim.
" let g:sneak#label = 1
Plug 'airblade/vim-rooter'
Plug 'whatyouhide/vim-lengthmatters' " highlight lines that are too long
let g:lengthmatters_excluded = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree', 'help', 'qf', 'dirvish', 'markdown']
Plug 'neomake/neomake' " Async linting
Plug 'Yggdroot/indentLine'
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

autocmd BufWritePost,BufEnter * Neomake

" End Vundle configuration
" This is all of my customization
" Some javascript linting stuff. Requires eslint_d is installed.
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint' " TODO: change this to vim's working directory, not the system's.
let g:neomake_python_enabled_makers = ['flake8']
" let g:hardtime_default_on = 1 "Enables hardtime by default
colorscheme gruvbox " I think this works on the airline bar also
let g:ycm_autoclose_preview_window_after_completion=1 " get rid of YCM window after autocomplete is done
set incsearch
noremap ; :
noremap : ;
nnoremap j gj
nnoremap k gk
inoremap jj <Esc>
set splitright " open new vsplit files on the right
set splitbelow " open new hsplit files on the bottom
autocmd Filetype javascript setlocal softtabstop=2 shiftwidth=2 tw=100 expandtab
autocmd Filetype java setlocal softtabstop=4 shiftwidth=4 tw=120 expandtab omnifunc=javacomplete#Complete
autocmd FileType python setlocal tw=79
" Make F9 execute python scripts
autocmd FileType python nnoremap <buffer> <F9> :w<cr> :exec '!clear; python' shellescape(@%, 1)<cr>
let g:rooter_patterns = ['.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/', '.idea/'] " Adding intellij base directories to vim rooter

autocmd FocusLost * set norelativenumber
autocmd FocusGained * set relativenumber

autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

" Toggle relative line numbers using <C-n>
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    " set number
  else
    " set nonumber
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" nnoremap <esc> :noh<return><esc>

set relativenumber
set nu
set numberwidth=2
