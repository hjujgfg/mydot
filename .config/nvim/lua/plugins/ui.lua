return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        colors.bg = "none"
        colors.bg_dark = "none"
        colors.bg_float = "none"
        colors.bg_sidebar = "none"
      end,
    },
  },
}
