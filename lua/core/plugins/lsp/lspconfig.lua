return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "pmizio/typescript-tools.nvim", -- ts_ls provided by this
      "nvim-lua/plenary.nvim",        -- required by typescript-tools
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- Python LSP (Pyright)
      lspconfig.pyright.setup({
        on_attach = function(client, bufnr)
          -- Enable diagnostics and set up how they appear
          vim.diagnostic.config({
            virtual_text = true,  -- Shows inline diagnostics
            signs = true,         -- Shows signs in the gutter
            underline = true,     -- Underlines errors
            update_in_insert = false, -- Disable updating diagnostics while typing
          })

          -- Key bindings for navigating through diagnostics
          vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, { buffer = bufnr }) -- Show error details in float
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr }) -- Go to previous diagnostic
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr }) -- Go to next diagnostic
        end,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",  -- Disable all type checking (change to 'basic' for minimal checks)
              diagnosticMode = "workspace",  -- Only show diagnostics for the workspace, not the open file
              useLibraryCodeForTypes = false,  -- Don't use library code for types
              reportUnknownVariableType = "none",  -- Don't show "unknown type" diagnostics
              reportUndefinedVariable = "none",    -- Don't report undefined variables
              reportMissingModuleSource = "none",  -- Don't report missing module source
            },
          },
        },
      })

      -- TypeScript/JavaScript LSP via typescript-tools (ts_ls)
      lspconfig.ts_ls.setup({
        settings = {
          tsserver_plugins = {},
        },
      })
    end,
  },
}

