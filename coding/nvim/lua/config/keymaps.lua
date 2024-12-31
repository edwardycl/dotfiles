-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "gh", "^", { silent = true })
vim.keymap.set("n", "gl", "$", { silent = true })

-- Keep the cursor at the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without changing the register
vim.keymap.set("x", "<leader>p", '"_dP')

-- Copy to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Terminal keymaps
vim.keymap.set("t", "<S-Space>", "<Space>")
vim.keymap.set("t", "<S-BS>", "<BS>")
-- TODO: terminal keymaps
-- vim.keymap.del("t", "<C-h>")
-- vim.keymap.del("t", "<C-j>")
-- vim.keymap.del("t", "<C-k>")
-- vim.keymap.del("t", "<C-l>")

vim.keymap.del({ "n", "i", "v" }, "<M-j>")
vim.keymap.del({ "n", "i", "v" }, "<M-k>")

vim.keymap.set("n", "<leader>cL", ":LspRestart<CR>", { desc = "LSP Restart" })
