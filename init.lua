require("core.keymaps")
require("core.lazy")

vim.opt.number = true         
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local hl = vim.api.nvim_get_hl_by_name("Normal", true)
    local bg = hl.background
    if bg then
      vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = bg, bg = "NONE" })
    end
  end,
})

local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
vim.api.nvim_set_hl(0, "ColorColumn", { bg = bg })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = bg })
vim.api.nvim_set_hl(0, "TabLine", { bg = bg })

-- Also apply once at startup
local bg = vim.api.nvim_get_hl_by_name("Normal", true).background
if bg then
  vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = bg, bg = "NONE" })
end
