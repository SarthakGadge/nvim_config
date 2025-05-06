-- Keymaps to make life easier
vim.g.mapleader = " " 
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>yc", "ggVGy", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ya", "ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

