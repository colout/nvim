return { -- Highlight, edit, and navigate code
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "bash",
          "c",
          "html",
          "lua",
          "luadoc",
          "markdown",
          "nix",
          "vim",
          "vimdoc",
          "sql",
          "vim",
          "regex",
          "dockerfile",
          "lua",
          "go",
          "bash",
          "diff",
        },

        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },

        incremental_selection = {
          enable = true,
          keymaps = {
            node_incremental = "<leader>v",
            --node_decremental = "<leader>V",
          },
        },
      })
    end,
  },
}
