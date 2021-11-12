-- Bootstrapping snippet
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Here we pass a function to `startup` and we specify `use` as an argument of this function
return require('packer').startup(function(use)
  -- Place all plugins and configurations below

  -- Plugin Manager
  -- packer can manager itself
  use {"wbthomason/packer.nvim"}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
