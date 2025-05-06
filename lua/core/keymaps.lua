-- Keymaps to make life easier
vim.g.mapleader = " " 
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>yc", "ggVGy", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ya", "ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
-- Better window navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
--Buffer management
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>')
vim.keymap.set('n', '<leader>bl', ':ls<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>bd', function()
  if vim.bo.modified then
    local choice = vim.fn.confirm("Buffer has unsaved changes. Save?", "&Yes\n&No\n&Cancel", 1)
    if choice == 1 then
      vim.cmd('write')        -- Save
      vim.cmd('bdelete')      -- Then delete
    elseif choice == 2 then
      vim.cmd('bdelete!')     -- Force delete without saving
    end
    -- If Cancel (3), do nothing
  else
    vim.cmd('bdelete')
  end
end, { desc = 'Safe buffer delete' })
