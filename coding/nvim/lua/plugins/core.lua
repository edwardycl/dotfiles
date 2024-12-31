return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
      ---@type string|fun()
      colorscheme = "onedark",
      -- load the default settings
      defaults = {
        autocmds = true, -- lazyvim.config.autocmds
        keymaps = true, -- lazyvim.config.keymaps
        -- lazyvim.config.options can't be configured here since that's loaded before lazyvim setup
        -- if you want to disable loading options, add `package.loaded["lazyvim.config.options"] = true` to the top of your init.lua
      },
    },
  },
}
