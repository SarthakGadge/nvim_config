-- lua/core/plugins/lualine.lua
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "kyazdani42/nvim-web-devicons",  -- Required for icons
  },
  opts = {
    options = {
      theme = "gruvbox",  -- Replace with your desired theme
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      icons_enabled = true,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    tabline = {
      lualine_a = { 'buffers' },  -- Show buffers in the tabline
    },
  },
  config = function()
    require('lualine').setup()
  end,
}

