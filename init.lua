-- always map your <LEADER> key at the very beginning
vim.g.mapleader = " "

require("plugins")
-- Enable colorscheme at the very end
require("colorscheme").setup()
