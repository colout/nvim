-- TODO: Refactor to remove "filetype" as a field and make it the primary key for each item

return {
  -- Lua
  {
    filetype = "lua",
    linters = { "luacheck" },
    formatters = {
      stylua = {
        prepend_args = { "--indent-type", "spaces", "--indent-width", "2" },
      },
    },

    format_on_save = true,
    luasnip_filetype_extend = true,

    servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    },
  },

  -- SQL
  {
    filetype = "sql",
    linters = { "sqlfluff" },
    formatters = { "sql-formatter" },
    format_on_save = false,
    luasnip_filetype_extend = false,
    servers = {
      --postgres_lsp = {},
      sqls = {},
      --sqlls = {
      --  filetypes = { "mysql", "sql" },
      --  root_dir = function()
      --    return vim.loop.cwd()
      --  end,
      --},
    },
  },

  -- bash / zsh
  filetype = "sh",
  linters = {},
  formatters = { "beautysh" },
  format_on_save = true,
  luasnip_filetype_extend = false,
  servers = {
    bashls = {
      settings = {
        filetypes = { "sh", "zsh" },
      },
    },
  },

  -- python
  {
    filetype = "python",
    linters = { "pylint" },
    formatters = { "black" },
    format_on_save = false,
    luasnip_filetype_extend = false,
    servers = {
      pyright = {},
    },
  },

  -- yaml
  {
    filetype = "yaml",
    linters = { "yamllint" },
    formatters = { "prettierd", "prettier" },
    format_on_save = false,
    luasnip_filetype_extend = false,
    servers = {
      yamlls = {},
    },
  },

  -- json
  {
    filetype = "json",
    linters = { "jsonlint" },
    formatters = { "prettier" },
    format_on_save = false,
    luasnip_filetype_extend = false,
    servers = {
      jsonls = {},
    },
  },

  -- markdown
  {
    filetype = "markdown",
    linters = { "markdownlint" },
    formatters = { "prettierd", "prettier" },
    format_on_save = false,
    luasnip_filetype_extend = false,
    servers = {
      marksman = {},
    },
  },

  -- terraform
  {
    filetype = "terraform",
    linters = { "tflint" },
    formatters = { "terraform_fmt" },
    mason_no_install_formatter = true,
    format_on_save = false,
    luasnip_filetype_extend = false,
    servers = {
      terraformls = {},
    },
  },

  -- nix
  {
    filetype = "nix",
    linters = {},
    formatters = { "alejandra" },
    mason_no_install_formatter = true,
    mason_no_install_lsp = true,
    mason_no_install_linter = true,
    format_on_save = true,
    luasnip_filetype_extend = false,
    servers = {
      nil_ls = {},
    },
  },

  -- c
  {
    filetype = "c",
    linters = {},
    formatters = {},
    format_on_save = true,
    luasnip_filetype_extend = false,
    servers = {
      clangd = {},
    },
  },

  -- dockerfile
  {
    filetype = "dockerfile",
    linters = { "hadolint" },
    formatters = { "hadolint" },
    format_on_save = false,
    luasnip_filetype_extend = false,
    servers = {
      dockerls = {},
    },
  },

  -- docker-compose
  {
    filetype = "docker-compose",
    linters = {
      --"docker_compose_lint"
    },
    formatters = {},
    format_on_save = true,
    luasnip_filetype_extend = false,
    servers = {
      docker_compose_language_service = {},
    },
  },

  -- golang
  {
    filetype = "go",
    linters = {
      --"docker_compose_lint"
    },
    formatters = {},
    format_on_save = false,
    luasnip_filetype_extend = false,
    servers = {
      gopls = {},
    },
  },
}
