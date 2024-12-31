return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        virtual_text = {
          prefix = "icons",
        },
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        clangd = {},
        tsserver = {},
        pyright = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
                library = {
                  ["/Applications/Hammerspoon.app/Contents/Resources/extensions/hs"] = true,
                },
              },
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = { "vim", "hs", "Snacks" },
              },
            },
          },
        },
        solidity_ls_nomicfoundation = {},
        html = {},
        cssls = {},
        jsonls = {},
        yamlls = {},
        bashls = {},
        dockerls = {},
        svelte = {},
        tailwindcss = {},
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
  -- formatters
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        solidity = { "prettier", "forge_fmt", stop_after_first = true },
        javascript = { "prettier", "biome", stop_after_first = true },
        typescript = { "prettier", "biome", stop_after_first = true },
        javascriptreact = { "prettier", "biome", stop_after_first = true },
        typescriptreact = { "prettier", "biome", stop_after_first = true },
      },
      formatters = {
        forge_fmt = {
          cwd = require("conform.util").root_file("foundry.toml"),
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          args = { "--disable", "MD013", "--" },
        },
      },
      linters_by_ft = {
        -- solidity = { "solhint" },
      },
    },
  },
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
}
