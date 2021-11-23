local M = {}

M.keymaps = {
  {"n", "<Tab>",   ":BufferNext<CR>",     { noremap = true, silent = true }},
  {"n", "<S-Tab>", ":BufferPrevious<CR>", { noremap = true, silent = true }},
  {"n", "Q",       ":BufferClose<CR>",    { noremap = true, silent = true }},
}

M.options = {
  animation = true,
  auto_hide = false,
  tabpages = true,
  closable = true,
  clickable = true,
  -- Excludes buffers from the bufferline
  exclude_ft = {
    "qf",
  },
  icons = true,
  icon_custom_colors = false,
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  insert_at_end = false,
  insert_at_start = false,
  maximum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = nil,
}

M.setup = function()
  require("keymaps").set_keymaps(M.keymaps)
  vim.g.bufferline = M.options
end

return M
