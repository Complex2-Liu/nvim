local M = {}

M.options = {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true, -- run `h: syntax` and tree-sitter at the same time
  },
}

M.setup = function()
  require("nvim-treesitter.configs").setup(M.options)
end

return M
