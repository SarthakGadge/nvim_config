-- lua/core/plugins/lsp/lspconfig.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "pmizio/typescript-tools.nvim", -- ts_ls provided by this
      "nvim-lua/plenary.nvim",        -- required by typescript-tools
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- Python LSP
      lspconfig.pyright.setup({})

      -- TypeScript/JavaScript LSP via typescript-tools (ts_ls)
      lspconfig.ts_ls.setup({
        settings = {
          tsserver_plugins = {},
        },
      })
    end,
  },
}

