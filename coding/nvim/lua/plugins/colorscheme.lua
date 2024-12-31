return {
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    opts = {
      style = "warmer",
      highlights = {
        ["NeoTreeGitConflict"] = { fmt = "bold" },
        ["NeoTreeGitUntracked"] = { fmt = "none" },
      },
    },
  },
}
