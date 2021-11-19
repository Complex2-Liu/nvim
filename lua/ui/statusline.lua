local M = {}

M.options = {
  options = {
    theme = "github",
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
  },

  sections = {
    lualine_a = {
      "mode",
    },
    lualine_b = {
      "branch",
      "filename",
    },
    lualine_c = {
      "diff",
    },

    lualine_x = {
      {
        -- see: https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua
        function()
          local msg = "No Active LSP"
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype') -- see `:h nvim_buf_get_option`
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then -- see: https://www.lua.org/manual/5.4/manual.html#pdf-next
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then -- see `:h eval` and search index() function
              return client.name
            end
          end
          return msg
        end,
        icon = " LSP:",
        color = { gui = "bold" },
      },
      {
        "diagnostics",
        source = { "nvim_lsp" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      }
    },
    lualine_y = {
      "filetype",
      "encoding",
      "fileformat",
    },
    lualine_z = {
      "location",
    },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {},
  extensions = {},
}

M.setup = function()
  require("lualine").setup(M.options)
end

return M
