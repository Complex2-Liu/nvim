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

### File Explorer

[nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua).
注意对于这个插件, options under the `g:` command (entries inside `M.options`) should be set **BEFORE**
running the `require("nvim-tree").setup` function (which load entries inside `M.setup_options`).

#### Keymaps

| key | function |
| --- | -------- |
| <kbd>F1</kbd> | toggle file explorer immediately |

The following keymaps are only available at nvimtree buffer:
| key | function |
| --- | -------- |
| <kbd>l</kbd> or 左键双击 | edit the file |
| <kbd>L</kbd> or 右键双击 | cd into the directory |
| <kbd>o</kbd> or <kbd>CR</kbd> | open a file with default system application or a folder with default file manager |
| <kbd>j</kbd> and <kbd>k</kbd> | navigate up or down |
| <kbd>Ctrl</kbd> + <kbd>v</kbd>| open the file in a vertical split |
| <kbd>Ctrl</kbd> + <kbd>x</kbd> | open the file in a horizontal split |
| <kbd>Tab</kbd> | open the file as a preview (keeps the cursor in the tree) |
| <kbd>P</kbd> | 光标聚焦于 parent node |
| <kbd>q</kbd> | close current opened directory or, if no such directory, behave as <kbd>P</kbd>
| <kbd>R</kbd> | refresh the tree |
| <kbd>h</kbd> | 很难描述, 你试了就知道 |
| <kbd>y</kbd> | copy file name |
| <kbd>Y</kbd> | copy relative path |
| <kbd>gy</kbd> | copy absolute path |
| <kbd>p</kbd> | paste from clipboard |
| <kbd>x</kbd> | add/remove file/directory to cut clipboard |
| <kbd>c</kbd> | add/remove file/directory to copy clipboard |
| <kbd>a</kbd> | add a file or directory if leaving a `/` at the end of the path |
| <kbd>d</kbd> | delete a file |
| <kbd>r</kbd> | rename a file |
| <kbd>H</kbd> | toggle visibility of dotfiles | |
