call plug#begin('~/.vim/plugged')
Plug 'ajh17/VimCompletesMe' " Sweet autocompletion.
Plug 'flazz/vim-colorschemes' " lots of colorschemes
set termguicolors
set background=dark
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " Ignore gitignored files
nnoremap <C-p> :FZF<cr> " open with ctrl-P
Plug 'tpope/vim-surround' " Makes it easy to modify matching brackets
Plug 'itchyny/lightline.vim' " cool status bar
set laststatus=2 " airline status bar always on
Plug 'tpope/vim-commentary' " Allow quick commenting of lines
Plug 'tpope/vim-repeat' " integrates . command with plugin commands
Plug 'airblade/vim-gitgutter' " Vim git gutter
Plug 'tpope/vim-unimpaired' " Some useful key bindings
Plug 'dense-analysis/ale' " Async linting
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ElmCast/elm-vim'
let g:ale_linters = { 'python': ['flake8'], 'javascript': [], 'cpp': ['cpplint', 'cppcheck', 'g++'], 'c': ['gcc'], 'scala': ['scalac'], 'haskell': ['stack-build'] }
let g:ale_c_gcc_options = '-std=c11 -Wall -Wextra -pedantic'
let g:ale_c_parse_makefile = 1

" Auto fix javascript code on save
let g:ale_fixers = {'javascript': ['eslint'], 'haskell': ['brittany'], 'elm': ['elm-format']}
let g:ale_fix_on_save = 1
let g:elm_format_autosave = 0 " ALE can fix elm with the elm-format fixer, no need to have two things which do the same thing
" Jump to previous and next error with j/k
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
Plug 'Yggdroot/indentLine'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'purescript-contrib/purescript-vim'
call plug#end()

syntax on

nnoremap <leader>w :exe 'Ag' expand('<cword>')<cr> " Ag for the word under the cursor

" End plugged configuration
" This is all of my customization
colorscheme gruvbox " I think this works on the airline bar also
set incsearch
noremap ; :
noremap : ;
nnoremap j gj
nnoremap k gk
inoremap jj <Esc>
" Make Y behave consistently to D and C
nnoremap Y y$
set showtabline=2

" show full path in lightline bar
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }


" add a buffer line (as opposed to a tabline)
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number = 1

let g:lightline#bufferline#filename_modifier = ':t'

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
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
autocmd FileType python setlocal tw=99
autocmd Filetype yaml setlocal softtabstop=2 shiftwidth=2 expandtab
autocmd BufRead,BufNewFile *.sky set filetype=python

set ignorecase
set smartcase

" Toggle relative line numbers using <C-m>
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

" nnoremap <C-m> :call NumberToggle()<CR>
"
let mapleader="\\"
nnoremap <leader>p :History<cr>
nnoremap <leader>o :Tags<cr>

set norelativenumber
set nu
set numberwidth=2

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" f5 deletes all hidden buffers
" nnoremap <F5> :call DeleteHiddenBuffers()<CR>

function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

set list listchars=tab:\|\-
set tabstop=4

nnoremap <C-]> g<C-]> " jump to tag under cursor, unless there are multiple. Then, show a list

command Bd bp\|bd \#
