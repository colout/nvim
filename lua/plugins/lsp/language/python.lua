return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = {
      servers = {
        basedpyright = {},
      },
      setup = {
        require("plugins.lsp.autoformat").auto_format_disabled("python", true),
        require("lspconfig").basedpyright.setup({}),
      },
    },
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").formatters_by_ft["python"] = { "black", "ruff" }
    end,
  },
}
