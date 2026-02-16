local excluded = {
  "node_modules",
  "dist",
  ".next",
  ".vite",
  ".git",
  ".gitlab",
  "build",
  "target",
  "public",
  "out",

  "package-lock.json",
  "pnpm-lock.yaml",
  "*.lock",
}
return {
  "folke/snacks.nvim",
  opts = {
    notifier = { enabled = true },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          exclude = excluded,
        },
      },
    },
  },
}
