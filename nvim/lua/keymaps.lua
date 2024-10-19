-- Leader key
vim.g.mapleader = "\\"

-- Basic remaps
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', 'Y', 'y$')

-- Window navigation
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-L>', '<C-w><C-l>')
vim.keymap.set('n', '<C-H>', '<C-w><C-h>')


-- Tags
vim.keymap.set('n', '<C-]>', 'g<C-]>')

-- Custom commands
vim.cmd([[command! Bd bp|bd #]])
