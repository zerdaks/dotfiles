-- Set relative line numbers
vim.opt.relativenumber = true

-- Enable spell checking
vim.opt.spell = true

-- Open help windows to the right of the current window
vim.cmd 'autocmd BufWinEnter * if &buftype == "help" | wincmd L | endif'

-- Conceal text for Obsidian and Orgmode
vim.opt.conceallevel = 1

-- Use fuzzy-matching to find completion matches
vim.opt.wildoptions = 'fuzzy'

-- Open splits below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Configure indentation
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end,
})

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

-- Do not open folds when moving with Shift+[ or Shift+]
vim.opt.foldopen:remove 'block'
