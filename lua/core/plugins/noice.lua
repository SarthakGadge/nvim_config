return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true,
        view = "cmdline_popup", -- floating cmdline
      },
      messages = {
        enabled = true,
      },
      presets = {
        command_palette = true, -- command line as popup
        lsp_doc_border = true,  -- border around hover/signature
      },
    })
  end,
  event = "VeryLazy",
}

