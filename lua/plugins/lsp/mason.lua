return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      {},
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-lspconfig").setup({
        automatic_installation = true, -- not the same as ensure_installed
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    init = function()
      local config_opts = {
        auto_update = true,
        run_on_start = true,
        ensure_installed = {},
      }

      -- Install everything in our central lsp configuration
      local f = require("plugins.lsp.lsp_configuration.config")
      for _, c in ipairs(f) do
        -- linters
        for _, l in ipairs(c.linters) do
          if not c.mason_no_install_linter then
            table.insert(config_opts.ensure_installed, l)
          end
        end

        -- lsp servers
        for server, _ in pairs(c.servers) do
          if not c.mason_no_install_lsp then
            table.insert(config_opts.ensure_installed, server)
          end
        end

        -- formatteors
        if not c.mason_no_install_formatter then
          for k, f in pairs(c.formatters) do
            if type(f) == "table" then
              table.insert(config_opts.ensure_installed, k)
            else
              table.insert(config_opts.ensure_installed, f)
            end
          end
        end
      end
      --print(vim.inspect(config_opts))
      require("mason-tool-installer").setup(config_opts)
    end,
  },
}
