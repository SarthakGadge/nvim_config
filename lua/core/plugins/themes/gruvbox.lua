return {
  {
    "ellisonleao/gruvbox.nvim",  -- Gruvbox plugin
    config = function()
      vim.cmd("colorscheme gruvbox")
      
vim.cmd [[
  highlight BufferLineFill guibg=NONE
  highlight BufferLineBackground guibg=NONE
  highlight BufferLineTab guibg=NONE
  highlight BufferLineTabSelected guibg=NONE
  highlight BufferLineSeparator guibg=NONE
  highlight BufferLineSeparatorSelected guibg=NONE
]]    end,
  },
}

