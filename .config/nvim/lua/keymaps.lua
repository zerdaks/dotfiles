local keymap = vim.keymap

-- https://stackoverflow.com/a/3776182

-- NORMAL MODE

-- Go to previous buffer
keymap.set('n', '<leader>,', '<cmd>bprevious<CR>')

-- Go to next buffer
keymap.set('n', '<leader><leader>', '<cmd>bnext<CR>')

-- Go to previously opened buffer
keymap.set('n', '<leader>.', '<cmd>b#<CR>')

-- Go to next diagnostic message, centered
keymap.set('n', '<leader>d', function()
  vim.diagnostic.jump { forward = true, count = 1 }
  vim.cmd 'normal! zz'
end)
--
-- Go to previous diagnostic message, centered
keymap.set('n', '<leader>D', function()
  vim.diagnostic.jump { forward = true, count = 1 }
  vim.cmd 'normal! zz'
end)

-- Go to next spelling error, centered
keymap.set('n', '<leader>s', ']szz')

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

-- Clear search highlights
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable movement with arrow keys
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('n', '<left>', '<nop>')
vim.keymap.set('n', '<right>', '<nop>')

-- Center screen when jumping
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- VISUAL AND SELECT MODES

-- Disable movement with arrow keys
vim.keymap.set('v', '<up>', '<nop>')
vim.keymap.set('v', '<down>', '<nop>')
vim.keymap.set('v', '<left>', '<nop>')
vim.keymap.set('v', '<right>', '<nop>')

-- VISUAL MODE

-- Paste the same value over selected text multiple times
-- 'p' to put/paste, 'gv' to select the text that was put, and 'y' to copy the selected text
keymap.set('x', 'p', 'pgvy')

-- INSERT MODE

-- Disable movement with arrow keys
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
