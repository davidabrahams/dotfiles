-- Basic settings
vim.opt.background = 'dark'
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 2
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 80
vim.opt.expandtab = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.fixendofline = false
vim.opt.showtabline = 2
vim.opt.cinoptions = 'l1'

-- Colorscheme
vim.opt.termguicolors = true

-- Filetype-specific settings
vim.cmd([[
autocmd Filetype javascript setlocal softtabstop=2 shiftwidth=2 tw=100
autocmd Filetype sh setlocal softtabstop=2 shiftwidth=2
autocmd Filetype cpp setlocal softtabstop=2 shiftwidth=2 commentstring=//\ %s
autocmd FileType json,yaml set softtabstop=2 shiftwidth=2
autocmd Filetype scala setlocal softtabstop=2 shiftwidth=2 tw=120
autocmd FileType python setlocal tw=120
autocmd BufRead,BufNewFile *.sky set filetype=python
autocmd BufRead,BufNewFile *BUILD set filetype=python
autocmd BufRead,BufNewFile *.bzl set filetype=python
]])

-- Highlight long lines
vim.cmd([[
highlight ColorColumn ctermbg=LightGray
call matchadd('ColorColumn', '\%121v', 100)
]])
