local M = {}

-- These options must be set BEFORE calling `require('nvim-tree')`
M.options = {
  git_hl = 1, -- enable file highlight for git attributes
  indent_markers = 1, -- show indent markers when folders are open
  add_trailing = 1, -- append a trailing slash to folder names
  highlight_opened_files = 1, -- enable folder and file icon highlight for opened files/directories
  -- show all icons
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
  },

  -- default will show icon by default if no icon is provided
  icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = " ",
      staged = "  ",
      unmerged = " ",
      renamed = "➜ ",
      deleted = " ",
      untracked = "★ ",
      ignored = "◌ ",
    },
    folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
    },
  },
}

M.setup_options = {
  auto_close = true, -- auto close when nvim-tree is the last window
  view = {
    mappings = {
      custom_only = true, -- don't use the default mappings, use the provided user mappings defined below
    },
  },
}

-- global keymaps
M.keymaps = {
  {"n", "<F1>", ":NvimTreeToggle<CR>", { noremap = true }},
}
-- provided user mappings, these keymaps only available at nvimtree buffer
-- ref: https://github.com/kyazdani42/nvim-tree.lua#user-content-keybindings
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
M.setup_options.view.mappings.list = {
  { key = {"l", "<2-LeftMouse>"},    cb = tree_cb("edit") },
  { key = {"L", "<2-RightMouse>"},   cb = tree_cb("cd")   },
  { key = {"o", "<CR>"},             cb = tree_cb("system_open") },

  { key = "<C-v>",                   cb = tree_cb("vsplit") },
  { key = "<C-x>",                   cb = tree_cb("split")  },
  { key = "<Tab>",                   cb = tree_cb("preview") },

  { key = "P",                       cb = tree_cb("parent_node") },
  { key = "q",                       cb = tree_cb("close_node") },
  { key = "R",                       cb = tree_cb("refresh") },
  { key = "-",                       cb = tree_cb("dir_up") },

  { key = "y",                       cb = tree_cb("copy_name") },
  { key = "Y",                       cb = tree_cb("copy_path") },
  { key = "gy",                      cb = tree_cb("copy_absolute_path") },

  { key = "p",                       cb = tree_cb("paste") },
  { key = "x",                       cb = tree_cb("cut") },
  { key = "c",                       cb = tree_cb("copy") },

  { key = "a",                       cb = tree_cb("create") },
  { key = "d",                       cb = tree_cb("remove") },
  { key = "r",                       cb = tree_cb("full_rename") },

  { key = "H",                       cb = tree_cb("toggle_dotfiles") },
}

M.setup = function()
  for opt, val in pairs(M.options) do
    vim.g["nvim_tree_" .. opt] = val
  end

  require("keymaps").set_keymaps(M.keymaps)
  require("nvim-tree").setup(M.setup_options)
end

return M
