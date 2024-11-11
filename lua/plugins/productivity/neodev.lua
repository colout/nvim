return {
  "folke/neodev.nvim",
  opts = {
    library = { plugins = { "nvim-dap-ui" }, types = true },
    setup_jsonls = true,
    lspconfig = true,
    pathStrict = true,
  },
}
