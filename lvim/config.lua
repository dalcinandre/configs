--Readthe docs: https://www.lunarvim.org/docs/configuration
--VideoTutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
--Forum:https://www.reddit.com/r/lunarvim/
--Discord:https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  "tpope/vim-abolish",
  "mfussenegger/nvim-dap",
  "leoluz/nvim-dap-go",
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      message_template = " <summary> • <date> • <author> • <<sha>>",
      date_format = "%m-%d-%Y %H:%M:%S",
    },
  },
  "mfussenegger/nvim-jdtls",
  -- {
  --   "github/copilot.vim",
  --   event = "VeryLazy",
  --   config = function()
  --     -- copilot assume mapped
  --     vim.g.copilot_assume_mapped = true
  --     vim.g.copilot_no_tab_map = true
  --   end,
  -- },
  -- {
  --   "hrsh7th/cmp-copilot",
  --   config = function()
  --     lvim.builtin.cmp.formatting.source_names["copilot"] = "( )"
  --     table.insert(lvim.builtin.cmp.sources, 2, { name = "copilot" })
  --   end,
  -- },
}

-- vim.keymap.set('i', '<Tab>', 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false
-- })
-- vim.g.copilot_no_tab_map = true

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

vim.cmd([[
  autocmd BufWritePre * %s/\(\s\|\t\|\r\)\+$//e
  autocmd BufWritePre * %s///e
  command! FixWhitespace %s/\(\s\|\t\|\r\)\+$//e
]])

lvim.keys.visual_block_mode = {
  ["<C-S-Down>"] = ":m '>+1<CR>gv=gv",
  ["<C-S-Up>"] = ":m '<-2<CR>gv=gv",
}

lvim.keys.normal_mode["<leader>|"] = ":vsplit<CR>"
lvim.keys.normal_mode["<leader>_"] = ":split<CR>"
lvim.keys.normal_mode["<tab>"] = ":bn<CR>"
lvim.keys.normal_mode["<S-tab>"] = ":bp<CR>"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

lvim.format_on_save = true
vim.opt.relativenumber = true
lvim.builtin.dap.active = true
vim.wo.colorcolumn = "81"
lvim.builtin.lualine.style = "default" -- default,lvim,none
vim.o.updatetime = 250

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.config({
      virtual_text = false
    })
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

lvim.lsp.automatic_installation = true
lvim.lsp.installer.setup.automatic_installation = true

--Prettierconfiguration
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "gofumpt" },
  --{ command = "eslint" },
  { command = "jq" },
  {
    command = "prettier",
    exe = "prettier",
  },
  {
    command = "clang-format",
    filetypes = { "java" },
    extra_args = { "--style", "Google" },
  },
})

--ESLint
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { command = "golangci_lint" },
  {
    command = "eslint",
    exe = "eslint",
  },
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
  {
    command = "eslint",
    exe = "eslint",
  },
})

local dap = require("dap")

--GOLANG
dap.adapters.go = {
  type = "server",
  port = "${port}",
  executable = {
    command = "dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}
dap.configurations.go = {
  {
    type = "go",
    name = "Attach",
    request = "attach",
    processId = require("dap.utils").pick_process,
    program = "${workspaceFolder}",
    dlvToolPath = vim.fn.exepath("dlv"),
  },
  {
    type = "go",
    name = "Debug curr file",
    request = "launch",
    program = "${file}",
    dlvToolPath = vim.fn.exepath("dlv"),
  },
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${workspaceFolder}",
    dlvToolPath = vim.fn.exepath("dlv"),
  },
  {
    type = "go",
    name = "Debug curr test",
    request = "launch",
    mode = "test",
    program = "${file}",
    dlvToolPath = vim.fn.exepath("dlv"),
  },
  {
    type = "go",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${workspaceFolder}",
    dlvToolPath = vim.fn.exepath("dlv"),
  },
}

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim",
          "lvim",
        },
      },
    },
  },
})

require('lspconfig').vuels.setup {}

--Telescopeignore
require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      ".git/",
      "node_modules/",
      "*.lock",
      "vendor/",
      "dist/",
      "build/",
      "target/",
      "vendor/*",
      "%.lock",
      "__pycache__/*",
      "%.sqlite3",
      "%.ipynb",
      "node_modules/*",
      "%.jpg",
      "%.jpeg",
      "%.png",
      "%.svg",
      "%.otf",
      "%.ttf",
      ".git/",
      "%.webp",
      ".dart_tool/",
      ".github/",
      ".gradle/",
      ".idea/",
      ".settings/",
      ".vscode/",
      "__pycache__/",
      "build/",
      "env/",
      "gradle/",
      "node_modules/",
      "target/",
      "%.pdb",
      "%.dll",
      "%.class",
      "%.exe",
      "%.cache",
      "%.ico",
      "%.pdf",
      "%.dylib",
      "%.jar",
      "%.docx",
      "%.met",
      "smalljre_*/*",
      ".vale/",
    },
  },
})
