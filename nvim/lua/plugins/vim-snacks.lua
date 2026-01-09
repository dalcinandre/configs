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

  "package-lock.json",
  "pnpm-lock.yaml",
  "yarn.lock",
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
