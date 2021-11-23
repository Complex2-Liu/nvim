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
| `F1` | toggle file explorer immediately |

The following keymaps are only available at nvimtree buffer:
| key | function |
| --- | -------- |
| `l` or 左键双击 | edit the file |
| `L` or 右键双击 | cd into the directory |
| `o` or `CR` | open a file with default system application or a folder with default file manager |
| `j` and `k` | navigate up or down |
| `Ctrl` + `v`| open the file in a vertical split |
| `Ctrl` + `x` | open the file in a horizontal split |
| `Tab` | open the file as a preview (keeps the cursor in the tree) |
| `P` | 光标聚焦于 parent node |
| `q` | close current opened directory or, if no such directory, behave as `P`
| `R` | refresh the tree |
| `h` | 很难描述, 你试了就知道 |
| `y` | copy file name |
| `Y` | copy relative path |
| `gy` | copy absolute path |
| `p` | paste from clipboard |
| `x` | add/remove file/directory to cut clipboard |
| `c` | add/remove file/directory to copy clipboard |
| `a` | add a file or directory if leaving a `/` at the end of the path |
| `d` | delete a file |
| `r` | rename a file |
| `H` | toggle visibility of dotfiles | |

### Gitsigns

[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim).
This plugin shows a git diff in the sign column. It shows which lines have been added, modified, or removed.
It also provides two keymaps which help you jump to the next/previous hunk:
| key | function |
| --- | -------- |
| `[c` | Jump to the previous hunk |
| `]c` | Jump to the next hunk |

### Telescope

[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim#pickers).
It is an incredible fuzzy finder built on Neovim's latest feature,
among all the plugins the most **essential** one!

Two external command line program [rg](https://github.com/BurntSushi/ripgrep)
and [fd](https://github.com/sharkdp/fd) is required.

Configurations are divided into three part:
  - `defaults`: This is Global Customization, `mappings` is one of the most important one.
  - `pickers`: This is Individual Customization, affecting every single picker.
  - `extensions`: Currently I only load one extension
  [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim).

#### Keymaps

The following keymaps can be customised in `defaults.mappings`,
please note that they are only available at telescope floating window:

| key | function |
| --- | -------- |
| `<ESC>` | Close telescope |
| `<Tab>` or `<C-j>` | Next item |
| `<S-Tab>` or `<C-k>` | Previous ite |
| `<C-p>` | Toggle selection |
| `<C-q>` | Smartly send item to quickfix list |
| `<CR>` | Confirm selection |

check out `smart_send_to_qflist()` in `:h telescope.actions` for meaning of "Smartly send item".

Keymaps call a builtin picker are listed below:

| key | function |
| --- | -------- |
| `<Leader>ff` | find_files |
| `<Leader>fg` | live_grep |
| `<Leader>vb` | buffers |
| `<Leader>vr` | registers |
| `<Leader>vk` | keymaps |
| `<Leader>vf` | current_buffer_fuzzy_find |
| `<Leader>ld` | lsp_definitions |
| `<Leader>t` | builtin | |

Check out [https://github.com/nvim-telescope/telescope.nvim#pickers](https://github.com/nvim-telescope/telescope.nvim#pickers)
for the meaning of every picker function.
