local C = require("config.colors")

return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        -- Keep hex format for internal blending math
        colors.bg_highlight = "#181e2b"
        colors.bg_visual = "#2a1c14"
        colors.bg_statusline = "#0b0e14"

        -- Laser Phosphor & Slate Comments
        colors.fg = C.fg
        colors.fg_dark = C.fg_dark
        colors.fg_gutter = C.fg_gutter
        colors.comment = C.comment

        -- Molten Lava / Avionics Remapping
        colors.orange = C.orange           -- Safety Orange (#ff5500)
        colors.blue = C.lava               -- Functions & Types -> Lava Orange (#ff6b2b)
        colors.blue1 = C.amber             -- Builtins & Vars -> Avionics Amber (#f59e0b)
        colors.blue5 = C.coral             -- Operators & Delimiters -> Magma Coral (#ff7847)
        colors.blue7 = "#1c2230"           -- Dim base for inlays
        colors.cyan = C.coral              -- Identifiers / Tags -> Magma Coral (#ff7847)
        colors.magenta = C.orange          -- Keywords & Statements -> Safety Orange (#ff5500)
        colors.purple = C.amber            -- Constants & Numbers -> Avionics Amber (#f59e0b)
        colors.yellow = C.amber            -- Special & Decorators -> Amber (#f59e0b)

        -- Telemetry States
        colors.red = C.red                 -- Fault Red (#e63946)
        colors.green = C.green             -- Strings & Telemetry -> Green (#10b981)
        colors.border = C.border           -- Seam Hairline (#1e2533)
        colors.border_highlight = C.orange -- Active Float Border (#ff5500)
      end,
      on_highlights = function(hl, c)
        -- Transparent base canvases (handled cleanly by highlight groups)
        hl.Normal = { bg = "none", fg = C.fg }
        hl.NormalNC = { bg = "none", fg = C.fg }
        hl.NormalFloat = { bg = "none", fg = C.fg }
        hl.FloatBorder = { fg = C.border, bg = "none" }
        hl.FloatTitle = { fg = C.orange, bg = "none", bold = true }
        hl.SignColumn = { bg = "none" }
        hl.StatusLine = { bg = "none" }
        hl.StatusLineNC = { bg = "none" }

        -- Active Line & Numbering
        hl.CursorLine = { bg = "#181e2b" }
        hl.CursorLineNr = { fg = C.orange, bold = true }
        hl.LineNr = { fg = C.fg_gutter }

        -- Visual selection (subtle molten tint)
        hl.Visual = { bg = "#3d1e10" }

        -- Search & Match
        hl.Search = { fg = "#07090d", bg = C.orange, bold = true }
        hl.IncSearch = { fg = "#07090d", bg = C.amber, bold = true }

        -- Gitsigns / Diffs
        hl.GitSignsAdd = { fg = C.green }
        hl.GitSignsChange = { fg = C.amber }
        hl.GitSignsDelete = { fg = C.red }
      end,
    },
  },
}
