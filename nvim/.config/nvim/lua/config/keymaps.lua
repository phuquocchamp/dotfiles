-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Scroll and center cursor
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Paste without overwriting the unnamed register
map("v", "p", '"_dP', { desc = "Paste without yanking selection" })

-- Exit terminal mode with Esc
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
