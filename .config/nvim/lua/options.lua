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

-- FOLDS

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