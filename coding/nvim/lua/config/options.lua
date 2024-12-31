-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- Indent
opt.wrap = true
opt.breakindent = true

-- Undo history
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Clipboard
opt.clipboard = ""

vim.filetype.add({
  filename = {
    [".eslintignore"] = "gitignore",
    [".prettierignore"] = "gitignore",
  },
  pattern = {
    [".*%.lalrpop"] = "lalrpop",
  },
})

vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }

opt.spelllang = { "en_us", "cjk" }

-- Set indentation based on filetype
local set_indent = function(ft, spaces)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      vim.bo.shiftwidth = spaces
      vim.bo.tabstop = spaces
    end,
  })
end

set_indent("javascript,typescript", 2)
set_indent("markdown", 2)
set_indent("python", 4)
set_indent("rust", 4)
set_indent("dockerfile", 4)
set_indent("solidity", 4)

vim.g.snacks_animate = false
