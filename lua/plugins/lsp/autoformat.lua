return { -- Autoformat
  "stevearc/conform.nvim",
  lazy = false,
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "LSP: [F]ormat",
    },
    {
      "<leader>tf",
      function()
        -- Toggle format on save
        vim.g.format_on_save = not vim.g.format_on_save
        vim.notify(string.format("Format on save: %s", vim.g.format_on_save and "on" or "off"))
      end,
      mode = "",
      desc = "Toggle format on save",
    },
  },

  opts = {
    -- TODO: move these to the language specific files
    disable_filetypes = {
      json = true,
      sql = true,
      pgsql = true,
      mysql = true,
      markdown = true,
      --python = true,
      yaml = true,
      terraform = true,
    },
  },

  -- Public function so other plugins can disable autoformat for a filetype
  auto_format_disabled = function(filetype, is_disabled)
    require("plugins.lsp.autoformat").opts.disable_filetypes[filetype] = is_disabled
  end,

  config = function()
    -- Initialize format on save state
    vim.g.format_on_save = true

    -- Lua formatter customization to force 2 spaces indentation
    require("conform").formatters.stylua = {
      prepend_args = { "--indent-type", "spaces", "--indent-width", "2" },
    }

    require("conform").setup({
      notify_on_error = false,

      -- Logic to only format on save if the toggle is on AND the filetype isn't configured in 'disable_filetypes'
      format_on_save = function(bufnr)
        local disable_filetypes = require("plugins.lsp.autoformat").opts.disable_filetypes
        -- Check global toggle state first
        if not vim.g.format_on_save then
          return false
        end

        if disable_filetypes[vim.bo[bufnr].filetype] then
          return false
        end

        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,

      --log_level = vim.log.levels.DEBUG,
      -- TODO: move these to the language specific files
      formatters_by_ft = {
        lua = { "stylua" },
        nix = { "alejandra" },
        json = { "prettier" },
        sql = { "pg_format" },
        pgsql = { "pg_format" },
        mysql = { "pg_format" },
        markdown = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        terraform = { "terraform_fmt" },
        --pgsql = { 'sqlfluff' },
      },
    })
  end,
}
