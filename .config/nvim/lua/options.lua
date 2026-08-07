-- termguicolors is required by bufferline and other plugins
vim.opt.termguicolors = true

-- Set relative line numbers
vim.opt.relativenumber = true

-- Set the command line height
vim.opt.cmdheight = 2

-- Enable spell checking
vim.opt.spell = true

-- Open help windows to the right of the current window
vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function()
    if vim.bo.buftype == 'help' then
      vim.cmd 'wincmd L'
    end
  end,
})

-- Conceal text for Obsidian and Orgmode
vim.opt.conceallevel = 2

-- Use fuzzy-matching to find completion matches
vim.opt.wildoptions = 'fuzzy'

-- Configure indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Configure white space
vim.opt.list = true
vim.opt.listchars = {
  eol = '↲',
  multispace = '·',
  tab = '»·',
  trail = '·',
}

-- FOLDS

-- Restore views for all file types when buffers are loaded
vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function()
    vim.cmd 'silent! loadview'
  end,
})

-- Do not open folds when moving with Shift+[ or Shift+]
vim.opt.foldopen:remove 'block'

-- COPILOT

-- Activate the copilot-language-server config shipped by nvim-lspconfig.
-- Sign in with :LspCopilotSignIn, see `:help lsp-copilot`
vim.lsp.enable 'copilot'

-- Show Copilot suggestions as ghost text in buffers where the server attaches
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, event.buf) then
      vim.lsp.inline_completion.enable(true, { bufnr = event.buf })
    end
  end,
})

-- Accept the current suggestion
vim.keymap.set('i', '<C-l>', vim.lsp.inline_completion.get, { desc = 'Accept inline completion' })
