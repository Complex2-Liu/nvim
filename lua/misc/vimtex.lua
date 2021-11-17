local M = {}

M.options = {
  -- zathura is a subprocess of nvim so it will inherit environment variable (NVIM_LISTEN_ADDRESS in particular)
  view_general_viewer = "setsid zathura",
}

M.setup = function()
  for opt, val in pairs(M.options) do
    vim.g["vimtex_" .. opt] = val
  end

  vim.g["tex_flavor"] = "latex"
end

return M
