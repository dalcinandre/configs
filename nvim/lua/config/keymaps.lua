-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- Visual Mode: mover seleção para cima/baixo
map("v", "<C-S-Up>", ":m '<-2<CR>gv=gv", { desc = "Mover seleção para cima" })
map("v", "<C-S-Down>", ":m '>+1<CR>gv=gv", { desc = "Mover seleção para baixo" })

-- Normal Mode: mover linha atual para cima/baixo
map("n", "<C-S-Up>", ":m .-2<CR>==", { desc = "Mover linha atual para cima" })
map("n", "<C-S-Down>", ":m .+1<CR>==", { desc = "Mover linha atual para baixo" })

-- Remover o mapeamento do LazyVim
vim.keymap.del("n", "<S-s>")
map({ "n", "x" }, "<S-s>", "S", { noremap = true, desc = "Substituir linha/seleção" })

map("n", "Y", '"+yy', { desc = "Copy line to system clipboard" })
map("v", "Y", '"+y', { desc = "Copy selection to system clipboard" })

-- map("n", "<leader>mp", "!glow %<CR>", { desc = "Preview Markdown no terminal" })
map("n", "<leader>mp", function()
  vim.cmd("vsplit | term glow " .. vim.fn.expand("%"))
end, { desc = "Preview Markdown com Glow (split vertical)" })

map("n", "<leader>;", ":lua Snacks.dashboard()<Cr>", { desc = "Voltar para o dashboard" })
