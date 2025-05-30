-- Set relative line numbers
vim.opt.relativenumber = true

-- Enable spell checking
vim.opt.spell = true

-- Open help windows to the right of the current window
vim.cmd 'autocmd BufWinEnter * if &buftype == "help" | wincmd L | endif'

-- Conceal text for Obsidian
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

-- Format JSON in the current buffer
vim.api.nvim_create_user_command('FmtJson', '%!jq .', {})

-- FOLDS

-- Restore views for all file types when buffers are loaded
vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function()
    vim.cmd 'silent! loadview'
  end,
})
