local M = {}

-- see https://stackoverflow.com/questions/11198382/how-to-create-a-key-map-to-open-and-close-the-quickfix-window-in-vim
M.QuickFixToggle = function()
  if (vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix")) == 1) then
    vim.cmd[[:copen]]
  else
    vim.cmd[[:cclose]]
  end
end

return M
