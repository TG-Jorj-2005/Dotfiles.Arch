local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>sv", ":Neotree open reveal<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>sh", ":split<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>q", ":close<CR>", opts)

vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>bd", ":bd<CR>", opts)
