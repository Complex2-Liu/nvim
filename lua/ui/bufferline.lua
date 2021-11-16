local M = {}

M.keymaps = {
  {"n", "<Tab>",   ":BufferNext<CR>",     { noremap = true, silent = true }},
  {"n", "<S-Tab>", ":BufferPrevious<CR>", { noremap = true, silent = true }},
  {"n", "Q",       ":BufferClose<CR>",    { noremap = true, silent = true }},
}

M.setup = function()
  require("keymaps").set_keymaps(M.keymaps)
end

return M
