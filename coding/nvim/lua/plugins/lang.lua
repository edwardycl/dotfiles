return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "J", function()
            vim.cmd.RustLsp("joinLines")
          end, { desc = "Join Lines", buffer = bufnr })
        end,
        default_settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            rustfmt = {
              extraArgs = { "+nightly" },
            },
            procMacro = {
              enable = true,
            },
            rustc = {
              source = "discover",
            },
            workspace = {
              symbol = {
                search = {
                  scope = "workspace_and_dependencies",
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/workspace/personal/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.keybinds"] = {
          config = {
            -- default_keybinds = false,
          },
        },
      },
    },
    keys = function()
      return {
        {
          "<leader>on",
          mode = { "n" },
          "<Plug>(neorg.dirman.new-note)",
          desc = "Neorg New Note",
        },
      }
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    -- TODO: migrate to fzf-lua
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
