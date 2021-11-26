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

  -- File Explorer
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("core.file-explorer").setup() end
  }

  use {
    "neovim/nvim-lspconfig",
    config = function() require("lsp.config").setup() end
  }

  -- Telescope
  -- also depends on
  -- (1) [ripgrep](https://github.com/BurntSushi/ripgrep)
  -- (2) [fd](https://github.com/sharkdp/fd)
  -- (3) nvim-treesitter below
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
      },
      "kyazdani42/nvim-web-devicons",
    },
    config = function() require("core.telescope").setup() end
  }

  -- nvim-treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    run = ":TSUpdate",
    config = function() require("core.treesitter").setup() end
  }

  -- Autocompletion
  use {
    "hrsh7th/nvim-cmp", -- completion ENGINE plugin, sources are installed as dependencies, 然后再加载这些 source
    requires = {
      "hrsh7th/cmp-buffer", -- source for buffer words
      "hrsh7th/cmp-nvim-lsp", -- source for neovim builtin LSP client
      "hrsh7th/cmp-path", -- source for filesystem paths
      "hrsh7th/cmp-nvim-lua", -- source for neovim Lua API
      "saadparwaiz1/cmp_luasnip", -- source for luasnip
      "L3MON4D3/LuaSnip", -- luasnip engine
    },
    config = function() require("core.autocompletion").setup() end
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    config = function() require("core.terminal").setup() end
  }

  -- gitsigns
  use {
    "lewis6991/gitsigns.nvim",
    event = "BufRead", -- lazyload on "BufRead" event, see `h: BufRead`
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function() require("core.gitsigns").setup() end
  }

  -- latex
  use {
    "lervag/vimtex",
    ft = { "tex", "latex" },
    config = function() require("misc.vimtex").setup() end
  }

  -- Bufferline
  use {
    "romgrk/barbar.nvim",
    event = "BufWinEnter", -- lazyload on "BufWinEnter" event, see: https://neovim.io/doc/user/autocmd.html#BufWinEnter
    config = function() require("ui.bufferline").setup() end
  }

  -- statusline
  use {
    "nvim-lualine/lualine.nvim",
    config = function() require("ui.statusline").setup() end
  }

  -- indentation
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("ui.indentation").setup() end
  }

  -- colorscheme
  use {"projekt0n/github-nvim-theme"}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
