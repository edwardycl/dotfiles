return {
  -- TODO: keybindings
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   ---@type Flash.Config
  --   opts = {
  --     label = {
  --       -- show the label after the match
  --       after = true, ---@type boolean|number[]
  --       -- show the label before the match
  --       before = true, ---@type boolean|number[]
  --       -- Enable this to use rainbow colors to highlight labels
  --       -- Can be useful for visualizing Treesitter ranges.
  --       rainbow = {
  --         enabled = true,
  --         -- number between 1 and 9
  --         shade = 5,
  --       },
  --     },
  --     -- You can override the default options for a specific mode.
  --     -- Use it with `require("flash").jump({mode = "forward"})`
  --     ---@type table<string, Flash.Config>
  --     modes = {
  --       -- options used when flash is activated through
  --       -- `f`, `F`, `t`, `T`, `;` and `,` motions
  --       char = {
  --         enabled = false,
  --       },
  --     },
  --   },
  --   keys = function()
  --     return {
  --       {
  --         "<C-f>",
  --         mode = { "n", "o", "x" },
  --         function()
  --           require("flash").jump()
  --         end,
  --         desc = "Flash",
  --       },
  --       {
  --         "<C-t>",
  --         mode = { "o", "x" },
  --         function()
  --           require("flash").treesitter()
  --         end,
  --         desc = "Flash Treesitter",
  --       },
  --       {
  --         "r",
  --         mode = "o",
  --         function()
  --           require("flash").remote()
  --         end,
  --         desc = "Remote Flash",
  --       },
  --       {
  --         "R",
  --         mode = { "o", "x" },
  --         function()
  --           require("flash").treesitter_search()
  --         end,
  --         desc = "Flash Treesitter Search",
  --       },
  --       {
  --         "<C-s>",
  --         mode = { "c" },
  --         function()
  --           require("flash").toggle()
  --         end,
  --         desc = "Toggle Flash Search",
  --       },
  --     }
  --   end,
  -- },
  -- Better increment/decrement
  {
    "monaqa/dial.nvim",
    opts = function(_, opts)
      local augend = require("dial.augend")

      local group_ext = {
        markdown = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
        },
      }
      for group, augends in pairs(group_ext) do
        for _, aug in ipairs(augends) do
          table.insert(opts.groups[group], aug)
        end
      end

      return opts
    end,
  },
  -- {
  --   "3rd/image.nvim",
  --   opts = {
  --     hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif", "*.ico", "*.bmp" },
  --   },
  -- },
  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      -- "3rd/image.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      auto_clean_after_session_restore = true,
      popup_border_style = "rounded",
      open_files_do_not_replace_types = { "terminal", "trouble", "qf", "help" },
      sources = { "filesystem", "buffers", "document_symbols" },
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
          { source = "document_symbols" },
        },
      },
      default_component_configs = {
        name = {
          highlight_opened_files = true,
        },
      },
      window = {
        mappings = {
          ["t"] = "toggle_node",
          ["Z"] = "expand_all_nodes",
          ["<C-c>"] = "revert_preview",
          -- TODO: image not working
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = false } },
        },
      },
      filesystem = {
        filtered_items = {
          hide_by_name = {
            "node_modules",
          },
          always_show = {
            ".gitignore",
            ".github",
            ".streamlit",
          },
          never_show = {
            ".DS_Store",
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
      buffers = {
        show_unloaded = true,
        window = {
          mappings = {
            ["<C-q>"] = "buffer_delete",
          },
        },
      },
      document_symbols = {
        follow_cursor = true,
      },
      event_handlers = {
        {
          event = "neo_tree_popup_input_ready",
          ---@param args { bufnr: integer, winid: integer }
          handler = function(args)
            -- vim.cmd("stopinsert")
            vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
          end,
        },
      },
    },
  },
}
