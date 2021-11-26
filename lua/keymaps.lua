local M = {}

M.keymaps = {
  {"n", "Y", "y$",                 { noremap = true }}, -- behave vim
  {"n", "J", "mzJ`z",              { noremap = true }}, -- join next line without messing up cursor
  {"v", ".", ":normal .<CR>",      { noremap = true }}, -- perform period commands over selected block
  {"n", "S", ":%s//g<Left><Left>", { noremap = true }}, -- global substitution
  {"v", "S", ":s//g<Left><Left>",  { noremap = true }}, -- perform substitution over selected block

  -- keep your mouse centered when searching
  {"n", "n", "nzzzv", { noremap = true }},
  {"n", "N", "Nzzzv", { noremap = true }},

  -- undo break point
  {"i", ",", ",<C-g>u", { noremap = true }},
  {"i", ".", ".<C-g>u", { noremap = true }},
  {"i", "!", "!<C-g>u", { noremap = true }},
  {"i", "?", "?<C-g>u", { noremap = true }},
  {"i", ";", ";<c-g>u", { noremap = true }},
  {"i", ":", ":<c-g>u", { noremap = true }},

  -- moving lines up or down
  -- ref: https://vim.fandom.com/wiki/Moving_lines_up_or_down
  {"v", "J", ":m '>+1<CR>gv=gv", { noremap = true }},
  {"v", "K", ":m '<-2<CR>gv=gv", { noremap = true }},

  -- better indenting at visual mode
  {"v", "<", "<gv", { noremap = true }},
  {"v", ">", ">gv", { noremap = true }},

  -- open and close window
  {"n", ",q", ":close<CR>", { noremap = true }},
  {"n", ",v", "<C-w>v",     { noremap = true }},
  {"n", ",x", "<C-w>s",     { noremap = true }},

  -- better window movement
  {"n", "<C-h>", "<C-w>h", { noremap = true }},
  {"n", "<C-j>", "<C-w>j", { noremap = true }},
  {"n", "<C-k>", "<C-w>k", { noremap = true }},
  {"n", "<C-l>", "<C-w>l", { noremap = true }},

  -- resize windows with arrows
  {"n", "<C-Up>",    ":resize +2<CR>",          { noremap = true }},
  {"n", "<C-Down>",  ":resize -2<CR>",          { noremap = true }},
  {"n", "<C-Left>",  ":vertical resize -2<CR>", { noremap = true }},
  {"n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true }},

  -- quickfix
  {"n", "]q",    ":cnext<CR>",                                              { noremap = true }},
  {"n", "[q",    ":cprev<CR>",                                              { noremap = true }},
  {"n", "<C-q>", '<cmd>lua require("utils.quickfix").QuickFixToggle()<CR>', { noremap = true }},

  -- terminal window navigation
  {"t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true }},
  {"t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true }},
  {"t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true }},
  {"t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true }},

  -- navigate tab completion with <C-j> and <C-k>
  {"c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { noremap = true, expr = true }},
  {"c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { noremap = true, expr = true }},
}

M.set_keymaps = function(tab)
  for k, v in pairs(tab) do
    vim.api.nvim_set_keymap(v[1], v[2], v[3], v[4])
  end
end

M.setup = function()
  M.set_keymaps(M.keymaps)
end

return M
