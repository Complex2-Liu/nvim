-- always map your <LEADER> key at the very beginning
vim.g.mapleader = " "

require("plugins")
require("settings").setup()
require("keymaps").setup()

-- Enable colorscheme at the very end
require("colorscheme").setup()
