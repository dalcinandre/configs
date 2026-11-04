--return {
--  -- add gruvbox
--  { "ellisonleao/gruvbox.nvim" },
--
--  -- Configure LazyVim to load gruvbox
--  {
--    "LazyVim/LazyVim",
--    opts = {
--      colorscheme = "gruvbox",
--    },
--  },
--}
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- Usaremos o estilo 'moon' como base para o seu tema dark
      transparent = false, -- Mude para true se quiser que o fundo do terminal apareça
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        -- Injetando suas cores do i3wm
        colors.bg = "#0A2E2A" -- Seu $bg
        colors.bg_dark = "#072320" -- Um tom ainda mais escuro para a sidebar
        colors.bg_float = "#123F3A" -- Seu $bg-alt
        colors.fg = "#E6ECEB" -- Seu $fg
        colors.green = "#4CA15D" -- Seu $green
        colors.red = "#AA3C41" -- Seu $red
        colors.blue = "#5A96B4" -- Seu $blue
        colors.comment = "#96AAA8" -- Seu $fg-inactive
        colors.border = "#4CA15D" -- Borda verde como no seu client.focused
      end,
      on_highlights = function(hl, c)
        -- Ajustes finos de contraste
        hl.LineNr = { fg = "#96AAA8" } -- Números de linha discretos
        hl.CursorLineNr = { fg = c.green, bold = true }
        hl.Visual = { bg = "#123F3A" } -- Destaque de seleção usando seu $bg-alt
        hl.Search = { bg = c.blue, fg = c.bg }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
