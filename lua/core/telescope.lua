local M = {}

M.keymaps = {
  {"n", "<Leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, }},
  {"n", "<Leader>fg", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]],  { noremap = true, }},
  {"n", "<Leader>fb", [[<cmd>lua require('telescope.builtin').buffers()<cr>]],    { noremap = true, }},
  {"n", "<Leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<cr>]],  { noremap = true, }},
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
