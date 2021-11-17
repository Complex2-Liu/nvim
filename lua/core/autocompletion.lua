local M = {}
local cmp = require("cmp")
local luasnip = require("luasnip")

M.kind_icons = {
  Class = " ",
  Color = " ",
  Constant = "ﲀ ",
  Constructor = " ",
  Enum = "練",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = "",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = " ",
  Module = " ",
  Operator = "",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  Struct = " ",
  Text = " ",
  TypeParameter = " ",
  Unit = "塞",
  Value = " ",
  Variable = " ",
}

M.source_names = {
  nvim_lsp = "(LSP)",
  emoji = "(Emoji)",
  path = "(Path)",
  calc = "(Calc)",
  luasnip = "(Snippet)",
  buffer = "(Buffer)",
  nvim_lua = "(Nvim Lua API)",
}

M.options = {
  formatting = {
    -- specify the display order from left to right
    -- in this case it will display like " local (Buffer)"
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item) -- see `:h complete-items` for documentation on vim_item attribute (kind, menu, etc)
      vim_item.kind = M.kind_icons[vim_item.kind]
      vim_item.menu = M.source_names[entry.source.name]
      return vim_item
    end,
  },

  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Border characters used for documentation window
  },

  -- global completion sources that will be enabled in all buffers
  -- the order of the list defines the priority of each source
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "buffer" },
  },

  -- depends on how your snippet engine *expand* the snippets
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  -- defines the action of each key mapping
  mapping = {
    -- two select behavior: "Insert" (default) and "Select"
    -- "Select" only select the item, while "Insert" will insert the item meanwhile
    ["<C-k>"] = cmp.mapping.select_prev_item(), 
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),

    -- "<Tab>" and "<S-Tab>" cycle through completion-item or snippet inserted-place
    ["<Tab>"] = cmp.mapping(function(fallback) -- The `fallback` is a function, which is treated as original mapped key
      if cmp.visible() then
      cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.jumpable() then
        luasnip.jump(1)
      else
        fallback()
      end
    end,
    {"i", "s"} -- specify mapping mode, in this case insert and select mode
    ),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
      cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
    {"i", "s"}
    ),
    
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false, -- if true, it will automatically selects the first item.
    }),
  },
}

M.setup = function()
  require("cmp").setup(M.options)
end

return M
