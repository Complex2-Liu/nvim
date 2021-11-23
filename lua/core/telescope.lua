local M = {}
local actions = require("telescope.actions")

M.keymaps = {
  -- Telescope builtin pickers
  -- file picker
  {"n", "<Leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, }},
  {"n", "<Leader>fg", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]],  { noremap = true, }},

  -- vim picker
  {"n", "<Leader>vb", [[<cmd>lua require('telescope.builtin').buffers()<cr>]],                   { noremap = true, }},
  {"n", "<Leader>vr", [[<cmd>lua require('telescope.builtin').registers()<cr>]],                 { noremap = true, }},
  {"n", "<Leader>vk", [[<cmd>lua require('telescope.builtin').keymaps()<cr>]],                   { noremap = true, }},
  {"n", "<Leader>vf", [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, }},

  -- lsp picker
  {"n", "<Leader>ld", [[<cmd>lua require('telescope.builtin').lsp_definitions()<cr>]], { noremap = true, }},

  -- lists picker
  {"n", "<Leader>t", [[<cmd>lua require('telescope.builtin').builtin()<cr>]], { noremap = true, }},
}

M.options = {
  defaults = {
    prompt_prefix = "🔭 ", -- the character(s) that will be shown in front of Telescope's prompt
    selection_caret = " ", -- the character(s) that will shown in front of the current selection
    sorting_strategy = "ascending", -- so that your cursor is on topmost
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },

    -- check out `lua/telescope/mappings.lua` and the `default_mappings` table to see a full list of mappings
    mappings = {
      i = {
        ["<ESC>"] = actions.close, -- not to enter normal-mode in telescope
        ["<Tab>"] = actions.move_selection_next,
        ["<S-Tab>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-p>"] = actions.toggle_selection,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default,
      },
    },
  },

  pickers = {
    find_files = {
      find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
    },
  },
}

M.setup = function()
  require("telescope").setup(M.options)
  require("keymaps").set_keymaps(M.keymaps)
  require("telescope").load_extension("fzf")
end

return M
