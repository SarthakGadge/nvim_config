-- lua/plugins/nvimtree.lua
return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        git = {
          enable = true,
          ignore = false,
          timeout = 400,
        },
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          highlight_git = true,
          icons = {
            show = {
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
      })

      -- Keymap to toggle the file explorer
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    end,
  },
}

