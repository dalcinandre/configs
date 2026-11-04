return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      -- Definindo as cores do seu i3wm
      local colors = {
        bg = "#0A2E2A",
        bg_alt = "#123F3A",
        fg = "#E6ECEB",
        green = "#4CA15D",
        red = "#AA3C41",
        blue = "#5A96B4",
        gray = "#96AAA8",
      }

      -- Criando o mapa de cores para cada modo
      local my_lualine_theme = {
        normal = {
          a = { bg = colors.green, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg_alt, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.gray },
        },
        insert = {
          a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg_alt, fg = colors.fg },
        },
        visual = {
          a = { bg = colors.gray, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg_alt, fg = colors.fg },
        },
        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg_alt, fg = colors.fg },
        },
        command = {
          a = { bg = colors.green, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg_alt, fg = colors.fg },
        },
        inactive = {
          a = { bg = colors.bg, fg = colors.gray },
          b = { bg = colors.bg, fg = colors.gray },
          c = { bg = colors.bg, fg = colors.gray },
        },
      }

      return {
        options = {
          theme = my_lualine_theme,
          globalstatus = true,
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
          lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
        },
      }
    end,
  },
}
