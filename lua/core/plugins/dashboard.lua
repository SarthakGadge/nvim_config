return {
  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- Needs to be loaded early to handle stdin properly
    opts = function()
      local logo = [[
                                                                        
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                        
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          statusline = false, -- Let lualine handle this
        },
        config = {
          header = vim.split(logo, "\n"),
          center = {
            { icon = " ",  desc = " Find File",       key = "f", action = 'lua LazyVim.pick()()' },
            { icon = " ",  desc = " New File",        key = "n", action = "ene | startinsert" },
            { icon = " ",  desc = " Recent Files",    key = "r", action = 'lua LazyVim.pick("oldfiles")()' },
            { icon = " ",  desc = " Find Text",       key = "g", action = 'lua LazyVim.pick("live_grep")()' },
            { icon = " ",  desc = " Config",          key = "c", action = 'lua LazyVim.pick.config_files()()' },
            { icon = " ",  desc = " Restore Session", key = "s", action = 'lua require("persistence").load()' },
            { icon = " ",  desc = " Lazy Extras",     key = "x", action = "LazyExtras" },
            { icon = "󰒲 ",  desc = " Lazy",            key = "l", action = "Lazy" },
            { icon = " ",  desc = " Quit",            key = "q", action = function() vim.api.nvim_input("<cmd>qa<cr>") end },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              "⚡ Neovim loaded "
              .. stats.loaded .. "/" .. stats.count
              .. " plugins in " .. ms .. "ms"
            }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },
}
