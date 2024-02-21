-- Set highlight on search
vim.o.hlsearch = true

-- Enable spell checking
vim.opt.spell = true

-- Set relative line numbers
vim.opt.relativenumber = true

-- Open help windows to the right of the current window
vim.cmd('autocmd BufWinEnter * if &buftype == "help" | wincmd L | endif')

-- Configure for Obsidian
vim.opt.conceallevel = 1

-- Use fuzzy-matching to find completion matches
vim.opt.wildoptions = 'fuzzy'

-- Open splits below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

--[[
WHITESPACE
--]]

-- Configure tab width
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

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

-- Save views for all file types when buffers are removed
autocmd('BufWinLeave', {
  pattern = '*.*',
  callback = function()
    vim.cmd.mkview()
  end,
  group = save_fold,
})

-- Restore views for all file types when buffers are loaded
autocmd('BufWinEnter', {
  pattern = '*.*',
  callback = function()
    vim.cmd.loadview({ mods = { emsg_silent = true } })
  end,
  group = save_fold,
})

--[[
KEY MAPPINGS
--]]

local opts = { noremap = true }

-- NON-RECURSIVE NORMAL MODE

-- Go to the previous buffer
vim.keymap.set('n', '<leader>,', '<cmd>bprevious<CR>', opts)

-- Disable to avoid repeating previous commands by mistake
vim.keymap.set('n', '<leader>.', '', opts)

-- Go to the next buffer
vim.keymap.set('n', '<leader><leader>', '<cmd>bnext<CR>', opts)

-- Repeat latest f, t, F or T in opposite direction
vim.keymap.set('n', '\'', ',', opts)

-- Delete a buffer
vim.keymap.set('n', '<leader>db', '<cmd>bd<CR>', opts)

-- Copy filename to clipboard
vim.keymap.set('n', '<leader>cp', '<cmd>let @*=expand("%")<CR>', opts)

-- Open a new tab page with an empty window
vim.keymap.set('n', '<leader>to', '<cmd>tabedit<CR>', opts)

-- Center search results
vim.keymap.set('n', 'n', 'nzz', opts)
vim.keymap.set('n', 'N', 'Nzz', opts)

-- Center screen after scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Disable movement with arrow keys
vim.keymap.set('n', '<up>', '<nop>', opts)
vim.keymap.set('n', '<down>', '<nop>', opts)
vim.keymap.set('n', '<left>', '<nop>', opts)
vim.keymap.set('n', '<right>', '<nop>', opts)

-- Disable movement with shift+arrow keys
vim.keymap.set('n', '<S-up>', '<nop>', opts)
vim.keymap.set('n', '<S-down>', '<nop>', opts)
vim.keymap.set('n', '<S-left>', '<nop>', opts)
vim.keymap.set('n', '<S-right>', '<nop>', opts)

-- Navigate splits
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize splits
vim.keymap.set('n', '<C-up>', '<cmd>resize -5<CR>', opts)
vim.keymap.set('n', '<C-down>', '<cmd>resize +5<CR>', opts)
vim.keymap.set('n', '<C-left>', '<cmd>vertical resize -5<CR>', opts)
vim.keymap.set('n', '<C-right>', '<cmd>vertical resize +5<CR>', opts)

-- Clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

-- NON-RECURSIVE VISUAL AND SELECT MODES

-- Do not copy deleted text
vim.keymap.set('v', 'd', '"_d', opts)

-- NON-RECURSIVE VISUAL MODE

-- Paste the same value multiple times
-- 'p' to put/paste, 'gv' to select the text that was put, and 'y' to copy the selected text
vim.keymap.set('x', 'p', 'pgvy', opts)
