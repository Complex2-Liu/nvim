local M = {}

-- specify all lsp servers here
M.servers = {
  "texlab", -- latex
  "bashls", -- bash
}

-- see https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter
M.diagnostic_symbol = {
  { name = "LspDiagnosticsSignError", icon = " " },
  { name = "LspDiagnosticsSignWarning", icon = " " },
  { name = "LspDiagnosticsSignHint", icon = " " },
  { name = "LspDiagnosticsSignInformation", icon = " " },
}

-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- keymaps
  -- see `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)    -- go to declaration
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)     -- go to definition
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)           -- show hover
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)     -- go to references
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation
end

M.setup = function()
  -- use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  for _, lsp in ipairs(M.servers) do
    require("lspconfig")[lsp].setup({
      on_attach = M.on_attach,
    })
  end

  -- change diagnostic symbols in the sign column
  for _, sign in ipairs(M.diagnostic_symbol) do
    vim.fn.sign_define(sign.name, { text = sign.icon, texthl = sign.name, numhl = sign.name })
  end
end

return M
