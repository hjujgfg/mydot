return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "basic", -- Less aggressive than "all"
                autoImportCompletions = true,
                diagnosticSeverityOverrides = {
                  -- Disable the "missing type stub" and "unknown type" annoyances
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
      },
    },
  },
}
