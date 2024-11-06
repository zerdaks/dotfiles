local keymap = vim.keymap

-- https://stackoverflow.com/a/3776182

-- NORMAL MODE

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

-- Disable movement with arrow keys
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('n', '<left>', '<nop>')
vim.keymap.set('n', '<right>', '<nop>')

-- Navigate splits
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

-- Clear search highlights
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Do not copy deleted text
keymap.set('n', 'x', '"_x')

-- VISUAL AND SELECT MODES

-- Do not copy deleted text
keymap.set('v', 'd', '"_d')

-- VISUAL MODE

-- Paste the same value multiple times
-- 'p' to put/paste, 'gv' to select the text that was put, and 'y' to copy the selected text
keymap.set('x', 'p', 'pgvy')
