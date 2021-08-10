call plug#begin('~/.vim/plugged')
Plug 'ajh17/VimCompletesMe' " Sweet autocompletion.
Plug 'flazz/vim-colorschemes' " lots of colorschemes
set termguicolors
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " Ignore gitignored files
nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>
Plug 'tpope/vim-surround' " Makes it easy to modify matching brackets
Plug 'itchyny/lightline.vim' " cool status bar
set laststatus=2 " airline status bar always on
Plug 'tpope/vim-commentary' " Allow quick commenting of lines
Plug 'tpope/vim-repeat' " integrates . command with plugin commands
Plug 'airblade/vim-gitgutter' " Vim git gutter
Plug 'tpope/vim-unimpaired' " Some useful key bindings
Plug 'dense-analysis/ale' " Async linting
Plug 'mengelbrecht/lightline-bufferline'
Plug 'Yggdroot/indentLine'
let g:ale_linters = { 'python': [], 'javascript': [], 'cpp': ['cpplint'], 'c': ['gcc'], 'scala': ['scalac'], 'haskell': ['stack-build'] }
" only run the linters explicitly listed above. New filetypes will not be linted without added to this list
let g:ale_linters_explicit = 1
let g:ale_c_gcc_options = '-std=c11 -Wall -Wextra -pedantic'
let g:ale_c_parse_makefile = 1

" Auto fix javascript code on save
let g:ale_fixers = {'javascript': ['eslint'], 'haskell': ['brittany'], 'elm': ['elm-format']}
let g:ale_fix_on_save = 1
let g:elm_format_autosave = 0 " ALE can fix elm with the elm-format fixer, no need to have two things which do the same thing
Plug 'purescript-contrib/purescript-vim'
call plug#end()

syntax on
set background=dark

nnoremap <leader>w :exe 'Ag' expand('<cword>')<cr>

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
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             ['filename', 'gitbranch' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ] ]
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
" Jump to previous and next error with j/k
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-L> <C-W><C-l>
nnoremap <C-H> <C-W><C-h>

set softtabstop=4 " how many spaces to insert when I hit <Tab> in insert mode
set shiftwidth=4 " how many spaces to shift on >>
set tw=80 " textwidth
set expandtab " create spaces in insert mode

autocmd Filetype javascript setlocal softtabstop=2 shiftwidth=2 tw=100
autocmd Filetype sh setlocal softtabstop=2 shiftwidth=2
autocmd Filetype cpp setlocal softtabstop=2 shiftwidth=2 commentstring=//\ %s
autocmd Filetype scala setlocal softtabstop=2 shiftwidth=2 tw=80
autocmd FileType python setlocal tw=99
autocmd BufRead,BufNewFile *.sky set filetype=python
autocmd BufRead,BufNewFile *BUILD set filetype=python

set ignorecase
set smartcase

let mapleader="\\"
nnoremap <leader>p :History<cr>
nnoremap <leader>o :Tags<cr>

set norelativenumber
set nu
set numberwidth=2

" jump to tag under cursor, unless there are multiple. Then, show a list
nnoremap <C-]> g<C-]>

" Bd deletes the current buffer, without closing the view it is in
command Bd bp\|bd \#

set backspace=indent,eol,start
