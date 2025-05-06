-- lua/core/plugins/themes/onedark.lua
return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup {
        style = "warmer", -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
      }
      require("onedark").load()
    end,
  },
}

