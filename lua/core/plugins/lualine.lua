-- lua/core/plugins/lualine.lua
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "kyazdani42/nvim-web-devicons",  -- Required for icons
  },
  opts = {
    options = {
      theme = "gruvbox",
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      icons_enabled = true,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        function()
          local bufnr = vim.fn.bufnr()
          local name = vim.fn.expand('%:t')
          if name == '' then name = '[No Name]' end
          return string.format('[%d] %s', bufnr, name)
        end,
        function()
          return vim.bo.modified and '●' or ''
        end,
      },
      lualine_x = { 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    tabline = {
      -- You can remove this if you don't want buffer tabs anymore
      lualine_a = { 'buffers' }
    },
  },
  config = function(_, opts)
    require('lualine').setup(opts)
  end,
}

