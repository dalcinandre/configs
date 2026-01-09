return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      vue = { "prettier" },
      python = { "black" },
      go = { "gofumpt" },
      php = { "php-cs-fixer" },
      java = { "google-java-format" },
    },
  },
}
