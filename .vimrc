call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs' " autocomplete matching quotes and paren
Plug 'ajh17/VimCompletesMe' " Sweet autocompletion.
Plug 'pangloss/vim-javascript' " javascript syntax and indentation
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 1 " only use jsx highlighting on jsx files
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
nnoremap <C-p> :FZF<cr> " open with ctrl-P
Plug 'tpope/vim-surround' " Makes it easy to modify matching brackets
Plug 'vim-airline/vim-airline' " cool status bar
set laststatus=2 " airline status bar always on
let g:airline#extensions#tabline#buffer_nr_show = 1 " show buffer numbers in tabline
let g:airline#extensions#tabline#enabled = 1 " show buffers in tabline
Plug 'tpope/vim-commentary' " Allow quick commenting of lines
Plug 'tpope/vim-repeat' " integrates . command with plugin commands
Plug 'airblade/vim-gitgutter' " Vim git gutter
Plug 'artur-shaik/vim-javacomplete2' " Java autocomplete
Plug 'tpope/vim-unimpaired' " Some useful key bindings
" Plug 'justinmk/vim-sneak' " This looks useful for when I actually become good at using vim.
" let g:sneak#label = 1
" Plug 'airblade/vim-rooter'
Plug 'whatyouhide/vim-lengthmatters' " highlight lines that are too long
let g:lengthmatters_excluded = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree', 'help', 'qf', 'dirvish', 'markdown']
Plug 'w0rp/ale' " Async linting
let g:ale_linters = { 'python': ['flake8'], 'javascript': ['eslint'], 'cpp': ['cpplint', 'cppcheck', 'g++'], 'c': ['gcc'], 'scala': ['scalac'] }
let g:ale_c_gcc_options = '-std=c11 -Wall -Wextra -pedantic'
let g:ale_c_parse_makefile = 1

" Auto fix javascript code on save
let g:ale_fixers = {'javascript': ['eslint'], 'scala': ['scalafmt']}
let g:ale_fix_on_save = 1
" Jump to previous and next error with j/k
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
Plug 'Yggdroot/indentLine'
" disable the concel feature of this plugin
let g:indentLine_setConceal = 0
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

syntax on

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
" Make Y behave consistently to D and C
nnoremap Y y$

set cinoptions=l1

set splitright " open new vsplit files on the right
set splitbelow " open new hsplit files on the bottom
" Have ctrl-h and ctrl-l switch to the left/right vsplit
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
autocmd Filetype javascript setlocal softtabstop=2 shiftwidth=2 tw=100 expandtab
autocmd Filetype sh setlocal softtabstop=2 shiftwidth=2 tw=80 expandtab
autocmd Filetype java setlocal softtabstop=4 shiftwidth=4 tw=120 expandtab omnifunc=javacomplete#Complete
autocmd Filetype c setlocal softtabstop=2 shiftwidth=2 tw=80 expandtab commentstring=//\ %s
autocmd Filetype cpp setlocal softtabstop=2 shiftwidth=2 tw=80 expandtab commentstring=//\ %s
autocmd Filetype scala setlocal softtabstop=2 shiftwidth=2 tw=120 expandtab
autocmd FileType python setlocal tw=79
autocmd Filetype yaml setlocal softtabstop=2 shiftwidth=2 expandtab
autocmd BufRead,BufNewFile *.sky set filetype=python " treat skylark as python
let g:rooter_patterns = ['.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/', '.idea/'] " Adding intellij base directories to vim rooter

set relativenumber

" Toggle relative line numbers using <C-m>
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    " set number
  else
    " set nonumber
    set relativenumber
  endif
endfunc

nnoremap <C-m> :call NumberToggle()<CR>

" use <C-n> and <C-b> to cycle buffers (I would use p for previous, but I'm so
" used to doing C-p to open files)
" nnoremap <C-n> :bnext<CR>
" nnoremap <C-b> :bprevious<CR>

" don't concel syntax in json files
let g:vim_json_syntax_conceal = 0

set relativenumber
set nu
set numberwidth=2

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" f5 deletes all hidden buffers
nnoremap <F5> :call DeleteHiddenBuffers()<CR>

function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

set list listchars=tab:\|\-
set tabstop=4
