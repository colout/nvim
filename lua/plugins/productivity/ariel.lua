return {
  "stevearc/aerial.nvim",
  opts = {},
  keys = {
    {
      "<leader>ta",
      "<cmd>AerialToggle<cr>",
      desc = "[T]oggle [A]erial",
    },
    {
      "<leader>fa",
      "<cmd>Telescope aerial<cr>",
      desc = "[F]ind using [A]erial",
    },
  },

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
