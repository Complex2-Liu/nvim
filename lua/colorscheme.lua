local M = {}

-- Specify your colorscheme name
M.colorscheme = "github-theme"

M.options = {
  transparent = true,
  keyword_style = italic,

  -- override any color you want to use below
  colors = {

  },
}

M.setup = function()
  require(M.colorscheme).setup(M.options)
end

return M
