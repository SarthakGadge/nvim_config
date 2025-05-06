return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  keys = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      mode = "tabs",
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "slant",
      always_show_bufferline = true,
    },
    highlights = {
      -- Gruvbox dark0_hard (#1d2021), dark1 (#282828), gray (#928374), fg1 (#ebdbb2), yellow (#fabd2f)
      fill = { bg = "NONE" },
      background = { bg = "#282828", fg = "#928374" }, -- dark1, gray
      tab = { bg = "#282828", fg = "#928374" }, -- dark1, gray
      tab_selected = { bg = "#1d2021", fg = "#ebdbb2", bold = true }, -- dark0_hard, fg1
      tab_separator = { bg = "#1d2021", fg = "#928374" }, -- dark0_hard, gray
      tab_separator_selected = { bg = "#1d2021", fg = "#fabd2f" }, -- dark0_hard, yellow
      buffer_visible = { bg = "#282828", fg = "#928374" },
      buffer_selected = { bg = "#1d2021", fg = "#ebdbb2", bold = true },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
}

