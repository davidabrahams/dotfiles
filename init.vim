call plug#begin('~/.local/share/nvim/plugged')
Plug 'Raimondi/delimitMate' " autocomplete matching quotes and paren
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' } " Sweet autocompletion. To install: cd ~/.vim/bundle/YouCompleteMe && ./install.py --all
Plug 'pangloss/vim-javascript' " javascript syntax and indentation
" Plug 'scrooloose/syntastic' " support for all kinds of linters
Plug 'KevinGoodsell/vim-csexact' " allows colorschemes to appear accurately in a terminal
Plug 'flazz/vim-colorschemes' " lots of colorschemes
Plug 'ctrlpvim/ctrlp.vim' " it seems likes this is more commonly used than command-t
let g:ctrlp_map = '<c-p>' " actually open ctrlp with <c-p>
Plug 'tpope/vim-surround' " Makes it easy to modify matching brackets
Plug 'vim-airline/vim-airline' " cool status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'takac/vim-hardtime' " forcing myself to actually learn to use vim
let g:hardtime_maxcount = 7 " Only allowed to use 3 of hjkl per second. I'm forcing myself to use vim :(
set laststatus=2 " airline status bar always on
Plug 'tpope/vim-commentary' " Allow quick commenting of lines
Plug 'tpope/vim-repeat' " integrates . command with plugin commands
Plug 'airblade/vim-gitgutter' " Vim git gutter
Plug 'artur-shaik/vim-javacomplete2' " Java autocomplete
Plug 'tpope/vim-unimpaired' " Some useful key bindings
" Plug 'justinmk/vim-sneak' " This looks useful for when I actually become good at using vim.
Plug 'gioele/vim-autoswap' " If you try to open a file that's already open in vim, it'll just switch over to it! Requires wmctrl is installed.
Plug 'airblade/vim-rooter'
Plug 'whatyouhide/vim-lengthmatters' " highlight lines that are too long
Plug 'neomake/neomake' " Async linting
Plug 'Yggdroot/indentLine'
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

autocmd BufWritePost,BufEnter * Neomake

" End Vundle configuration
" This is all of my customization

" Some javascript linting stuff. Requires eslint_d is installed.
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exec = 'eslint_d'
let g:neomake_python_enabled_makers = ['flake8']
" let g:syntastic_check_on_open=1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'eslint_d'
" let g:syntastic_cpp_checkers = ['cpplint']
" let g:syntastic_cpp_cpplint_exec = 'cpplint' " use cpplint for C++ linting. sudo pip install cpplint
let g:hardtime_default_on = 1 "Enables hardtime by default
colorscheme Tomorrow-Night " I think this works on the airline bar also
" set completeopt-=preview " disable annoying preview window YouCompleteMe opens all the time
let g:ycm_autoclose_preview_window_after_completion=1 " get rid of YCM window after autocomplete is done
set tw=80 "text width
nnoremap ; :
nnoremap : ;
set splitright " open new vsplit files on the right
set splitbelow " open new hsplit files on the bottom
" let g:syntastic_java_javac_config_file_enabled = 1
autocmd Filetype javascript setlocal softtabstop=2 shiftwidth=2 tw=100 expandtab
autocmd Filetype java setlocal softtabstop=4 shiftwidth=4 tw=120 expandtab
autocmd BufNewFile,BufReadPost *.md set filetype=markdown " enable markdown syntax highlighting
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:rooter_patterns = ['.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/', '.idea/'] " Adding intellij base directories to vim rooter

" autocmd InsertEnter * :call EndHighlight()

" map n :call RepeatLastSearch()<CR>

" function EndHighlight()
"     match
"     let s:lastsearch = @/
"     nohlsearch
"     redraw
" endfunction

" function RepeatLastSearch()
"     exe "match Search /".s:lastsearch."/"
"     call search(s:lastsearch, "W")
" endfunction

autocmd FocusLost * set norelativenumber number 
autocmd FocusGained * set nonumber relativenumber 

autocmd InsertEnter * set norelativenumber number 
autocmd InsertLeave * set nonumber relativenumber 

" Toggle relative line numbers using <C-n>
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

nnoremap <esc> :noh<return><esc>
