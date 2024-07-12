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
vim.wo.wrap = false;

harpoon:setup()
vim.keymap.set('n', '<leader>nn', function() require('neotest').run.run() end)
vim.keymap.set('n', '<leader>nf', function() require('neotest').run.run(vim.fn.expand('%')) end)
vim.keymap.set('i', '<C-c>', function() require("copilot.suggestion").accept() end)

vim.keymap.set('n', '<leader>y', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader> ', builtin.git_files,{})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles,{})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.api.nvim_set_keymap('n', '<leader>t', ':Neotree float reveal=true<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>v', ':Neotree float git_status reveal=true<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>b', ':Neotree float buffers <CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>x', ':Centerpad<cr>', { silent = true, noremap = true })

vim.keymap.set('n', '<leader>s', ':vsplit<CR>', {})

vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>hz", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR})
end, {remap=true})

vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR})
end, {remap=true})

vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
end, {remap=true})

vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, hint_offset = 1 })
end, {remap=true})

vim.api.nvim_set_keymap('n', '<leader>cf', ':lua require("conform").format()<CR>', { noremap = true, silent = true })

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

local set = vim.opt -- set options
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2

vim.cmd([[autocmd VimEnter * Copilot auth]])

vim.opt.listchars = {
    eol = '¬',
    tab = '>·',
    trail = '~',
    extends = '>',
    precedes = '<',
    space = '·'
}
vim.opt.list = true

-- require('tabnine').setup({
--  disable_auto_comment=true,
--  accept_keymap="<C-c>",
--  dismiss_keymap = "<C-]>",
--  debounce_ms = 800,
--  suggestion_color = {gui = "#800080", cterm = 244},
--  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
--  log_file_path = nil, -- absolute path to Tabnine log file
-- })
--
--
--
--
