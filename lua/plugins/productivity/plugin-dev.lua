return {
  -- Plugin for local plugin development
  {
    'folke/neodev.nvim',
    opts = {
      library = { plugins = { "neotest" }, types = true },
    }
  },
  {
    'nvim-lua/plenary.nvim', -- Required for plugin development
    priority = 1000,
  },
}
