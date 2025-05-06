return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        theme = "wave", -- 'wave', 'dragon', or 'lotus'
        background = {
          dark = "wave",
          light = "lotus"
        },
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
}

