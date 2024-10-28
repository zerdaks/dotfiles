-- Set highlight on search
vim.o.hlsearch = true

-- Enable spell checking
vim.opt.spell = true

-- Set relative line numbers
vim.opt.relativenumber = true

-- Open help windows to the right of the current window
vim.cmd 'autocmd BufWinEnter * if &buftype == "help" | wincmd L | endif'

-- Conceal text
vim.opt.conceallevel = 1

-- Use fuzzy-matching to find completion matches
vim.opt.wildoptions = 'fuzzy'

-- Open splits below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

--[[
WHITESPACE
--]]

-- Configure tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- Configure white space
vim.opt.list = true
vim.opt.listchars = {
  eol = '↲',
  multispace = '·',
  tab = '»·',
  trail = '·',
}

--[[
FOLDS
--]]

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local save_fold = augroup('SaveFolds', { clear = true })

-- Restore views for all file types when buffers are loaded
autocmd('BufWinEnter', {
  pattern = '*.*',
  callback = function()
    vim.cmd.loadview { mods = { emsg_silent = true } }
  end,
  group = save_fold,
})

--[[
KEY MAPPINGS
--]]

local keymap = vim.keymap

-- NON-RECURSIVE NORMAL MODE

-- Go to previous buffer
keymap.set('n', '<leader>,', '<cmd>bprevious<CR>')

-- Go to next buffer
keymap.set('n', '<leader><leader>', '<cmd>bnext<CR>')

-- Disable to avoid repeating previous commands by mistake
keymap.set('n', '<leader>.', '')

-- Go to next diagnostic message
keymap.set('n', '<leader>d', vim.diagnostic.goto_next)

-- Repeat latest f, t, F or T in opposite direction
keymap.set('n', "'", ',')

-- Copy relative file path to clipboard
keymap.set('n', '<leader>cp', '<cmd>let @* = expand("%:p:~:.")<CR>')

-- Delete current buffer
keymap.set('n', '<leader>db', '<cmd>bd<CR>')

-- Save view of current buffer
keymap.set('n', '<leader>mk', '<cmd>mkview<CR>')

-- Open new tab
keymap.set('n', '<leader>to', '<cmd>tabedit<CR>')

-- Center screen after scrolling
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- Navigate splits
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

-- Clear search highlights
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Do not copy deleted text
keymap.set('n', 'x', '"_x')

-- NON-RECURSIVE VISUAL AND SELECT MODES

-- Do not copy deleted text
keymap.set('v', 'd', '"_d')

-- NON-RECURSIVE VISUAL MODE

-- Paste the same value multiple times
-- 'p' to put/paste, 'gv' to select the text that was put, and 'y' to copy the selected text
keymap.set('x', 'p', 'pgvy')
