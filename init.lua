require('plugins')
require('onedark').load()
local map = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
map('n', '<leader>p',  [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })

map('n', '<leader>n',  ':NvimTreeToggle<CR>', { noremap = true, silent = true })
