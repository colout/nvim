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
        local disable_filetypes = {
          json = true,
          sql = true,
          pgsql = true,
          mysql = true,
          markdown = true,
          python = true,
          yaml = true,
          terraform = true,
        }

        if disable_filetypes[vim.bo[bufnr].filetype] then
          return false
        end

        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      --log_level = vim.log.levels.DEBUG,
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
        terraform = { 'terraform_fmt' },
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
