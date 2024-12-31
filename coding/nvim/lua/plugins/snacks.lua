return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<C-q>",
        function()
          Snacks.bufdelete()
        end,
        desc = "Delete Buffer",
      },
    },
  },
}
