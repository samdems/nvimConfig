-- bootstrap lazy.nvim, LazyVim and your plugins
--
--
vim.g.mapleader = " "

require("config.lazy")
local harpoon = require("harpoon")
local builtin = require('telescope.builtin')

vim.cmd[[colorscheme tokyonight]]
vim.api.nvim_command('set colorcolumn=120,80')
vim.wo.number = true
vim.wo.relativenumber = true

harpoon:setup()


vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader> ', builtin.git_files,{})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles,{})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.api.nvim_set_keymap('n', '<leader>t', ':Neotree<CR>', {noremap = true, silent = true})

vim.keymap.set('n', '<leader>s', ':vsplit<CR>', {})

vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>hz", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.api.nvim_set_keymap('n', '<leader>cf', ':lua require("conform").format()<CR>', { noremap = true, silent = true })
