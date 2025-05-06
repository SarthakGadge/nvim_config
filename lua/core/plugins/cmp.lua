-- Inside your `lua/plugins/cmp.lua` or similar file
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
    "hrsh7th/cmp-buffer",    -- Buffer completions
    "hrsh7th/cmp-path",      -- Path completions
    "hrsh7th/cmp-cmdline",   -- Cmdline completions
  },
  config = function()
    local cmp = require("cmp")

    -- Key mappings for nvim-cmp
    cmp.setup({
      completion = {
        autocomplete = {cmp.TriggerEvent.TextChanged},
      },
      mapping = {
        -- Confirm selection with Enter or Tab
        ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- Confirm with Enter
        ["<Tab>"] = cmp.mapping.select_next_item(),         -- Next item with Tab
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),       -- Previous item with Shift+Tab
        ["<C-Space>"] = cmp.mapping.complete(),             -- Trigger completion with Ctrl+Space
      },
      sources = {
        { name = "nvim_lsp" }, -- LSP source
        { name = "buffer" },
        { name = "path" },
      },
    })
  end,
}

