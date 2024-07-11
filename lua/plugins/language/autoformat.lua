return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>lf',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = 'LSP: [F]ormat',
    },
  },

  config = function()
    -- Lua formatter customization to force 2 spaces indentation
    require('conform').formatters.stylua = {
      prepend_args = { '--indent-type', 'spaces', '--indent-width', '2' },
    }

    require('conform').setup {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local enable_filetypes = {
          lua = true,
          nix = true,
        }

        return {
          timeout_ms = 500,
          lsp_fallback = enable_filetypes[vim.bo[bufnr].filetype],
          --lsp_fallback = false,
        }
      end,
      log_level = vim.log.levels.DEBUG,
      formatters_by_ft = {
        lua = { 'stylua' },
        nix = { 'alejandra' },
        json = { 'prettier' },
        sql = { 'pg_format' },
        pgsql = { 'pg_format' },
        mysql = { 'pg_format' },
        markdown = { 'prettierd', 'prettier' },
        python = { 'isort' },
        yaml = { 'prettierd', 'prettier' },
        --pgsql = { 'sqlfluff' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    }
  end,
}
