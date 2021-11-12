# Complex2liu's build of Neovim

## Collection of Neovim plugins I use

[awesome-neovim](https://github.com/rockerBOO/awesome-neovim)
is a github repository which collects a bunch of awesome plugins targeting Neovim specific features.
If you have no idea where to start, taking a look at it may help you.

### Plugin Manager

[packer.nvim](https://github.com/wbthomason/packer.nvim).
Packer is built on native packages, you may wish to read `:h packages` before continuing.

Packer 将所有的 plugins 都存放在以下两个文件夹中:
`~/.local/share/nvim/site/pack/packer/` 目录下的 `start/` 和 `opt/`.
其中 `start/` 目录下的 plugins will be loaded automatically when neovim start up,
而 `opt/` 目录下的 plugins 被称为 "Optional plugins",
我们可以通过 `:packadd packer.nvim` 来加载一个 optional plugin,
such plugin is typically used for **lazy-load**.

`use` 接收一个 table, which may contains following (useful) keywords:
  - `opt = boolean`: If true, mark this plugin as optional plugin.
  - `requires = string or list`: Specifies plugin dependencies.
  - `config = string or function`: Specifies code to run after this plugin is loaded.
  - `setup = string or function`: Specifies code to run before this plugin is loaded.
  This keyword indirectly implies that `opt = true`.
  - `ft = string or list`: Lazy-load with filetype.

Once `packer` is loaded, it provides several commands, among which the most useful two are:
```
-- Update everything
:PackerSync

-- Remove any disabled or unused plugins
:PackerClean
```
