return {
  {
    -- Base (dummy dependency segura)
    "nvim-lua/plenary.nvim",
    lazy = false,

    config = function()
      --------------------------------------------------
      -- SPELL APENAS EM ARQUIVOS DE TEXTO
      --------------------------------------------------
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "markdown",
          "text",
          "gitcommit",
          "asciidoc",
          "rst",
          "org",
        },
        callback = function()
          vim.opt_local.spell = true
          vim.opt_local.spelllang = { "pt_br", "en_us" }
          vim.opt_local.spelloptions = { "camel" }
        end,
      })

      --------------------------------------------------
      -- TOGGLE GLOBAL
      --------------------------------------------------
      vim.keymap.set("n", "<leader>ts", function()
        vim.opt.spell = not vim.opt.spell:get()
      end, { desc = "Toggle Spell Check" })

      --------------------------------------------------
      -- HIGHLIGHT ACESSÍVEL
      --------------------------------------------------
      vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "#ff6b6b" })
      vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = "#ffd93d" })
      vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = "#6bcBef" })
      vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = "#51cf66" })
    end,
  },
}
