call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs' " autocomplete matching quotes and paren
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' } " Sweet autocompletion.
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " Ignore gitignored files
nnoremap <c-p> :FZF<cr> " open with ctrl-P
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
Plug 'w0rp/ale' " Async linting
let g:ale_linters = {'javascript': ['eslint']}
" Auto fix javascript code on save
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
" Jump to previous and next error with j/k
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
Plug 'Yggdroot/indentLine'
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

" End plugged configuration
" This is all of my customization
colorscheme gruvbox " I think this works on the airline bar also
let g:ycm_autoclose_preview_window_after_completion=1 " get rid of YCM window after autocomplete is done
set incsearch
noremap ; :
noremap : ;
nnoremap j gj
nnoremap k gk
inoremap jj <Esc>

" Remap F5 to bring up a list of buffers, and allow user to then enter a
" number and switch to it
nnoremap <F5> :buffers<CR>:buffer<Space>
set splitright " open new vsplit files on the right
set splitbelow " open new hsplit files on the bottom
syntax on
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

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
