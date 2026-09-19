return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                diagnosticSeverityOverrides = {
                  reportMissingTypeStubs = "none",
                  reportUnknownParameterType = "none",
                  reportUnknownVariableType = "none",
                  reportUnknownMemberType = "none",
                  reportMissingParameterType = "none",
                },
              },
            },
          },
        },
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
            },
          },
        },
        lua_ls = {},
        bashls = {},
        jsonls = {},
        cssls = {},
        marksman = {},
      },
      setup = {
        ruff = function()
          Snacks.util.lsp.on({ name = "ruff" }, function(_, client)
            -- Disable hover in favor of basedpyright
            client.server_capabilities.hoverProvider = false
          end)
        end,
      },
    },
  },

  {
    "mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "basedpyright",
        "ruff",
        "lua-language-server",
        "bash-language-server",
        "json-lsp",
        "css-lsp",
        "marksman",
        "stylua",
        "shfmt",
        "shellcheck",
        "prettier",
      })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        sh = { "shellcheck" },
        bash = { "shellcheck" },
      },
    },
  },
}
