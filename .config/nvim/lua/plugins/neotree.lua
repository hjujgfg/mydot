return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        use_libuv_file_watcher = true, -- This makes updates "instant"
        follow_current_file = {
          enabled = true, -- Focuses the file in the tree when you switch buffers
        },
      },
    },
  },
}
