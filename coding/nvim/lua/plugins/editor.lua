local fzf_actions = require("fzf-lua").actions

return {
  {
    "ibhagwan/fzf-lua",
    optional = true,
    opts = {
      files = {
        actions = {
          ["alt-i"] = false,
          ["alt-h"] = false,
          ["ctrl-i"] = { fzf_actions.toggle_ignore },
          ["ctrl-h"] = { fzf_actions.toggle_hidden },
        },
      },
      grep = {
        actions = {
          ["alt-i"] = false,
          ["alt-h"] = false,
          ["ctrl-i"] = { fzf_actions.toggle_ignore },
          ["ctrl-h"] = { fzf_actions.toggle_hidden },
        },
      },
    },
  },
  -- TODO: change keybindings
  {
    "folke/flash.nvim",
    enabled = false,
  },
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
