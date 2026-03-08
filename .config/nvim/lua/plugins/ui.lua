return {
  -- We are telling LazyVim to modify the 'nvim-cmp' plugin
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- opts.sources contains where suggestions come from
      -- We filter it to REMOVE the one named "buffer"
      opts.sources = vim.tbl_filter(function(source)
        return source.name ~= "buffer"
      end, opts.sources)
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
