return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Useful status updates for LSP.
    { 'j-hui/fidget.nvim', opts = {} },

    -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
    { 'folke/neodev.nvim', opts = {} },
    'folke/which-key.nvim',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Replace some builtins
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>lD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- Some LSP commands (might be some duplicates fromt he buildins above for now...)
        map('<leader>lt', require('telescope.builtin').lsp_type_definitions, 'Goto [T]ype definition')
        map('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document [S]ymbols')
        map('<leader>lw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace symbols')

        -- enable/disable LSP diagnostics
        -- LSP Saga did these better:
        -- map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        -- map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        -- map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      end,
    })
    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- :h lspconfig-all
    local servers = {
      sqlls = {
        filetypes = { 'mysql', 'sql' },
        root_dir = function()
          return vim.loop.cwd()
        end,
      },

      lua_ls = { -- lua
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },

      yamlls = {}, -- yaml
      jsonls = {}, -- json

      marksman = {}, -- markdown
      terraformls = {}, -- terraform
      gopls = {}, -- golang

      nil_ls = {}, --nix

      clangd = {}, --c, cpp

      -- python:
      pyright = {},

      -- docker:
      docker_compose_language_service = {},
      dockerls = {},
    }

    for server, conf in pairs(servers) do
      require('lspconfig')[server].setup { conf }
    end

    -- Below is completely unused
    -- ... Just leftover from my kickstart config, and I want to create some docs/automation on this later
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      -- Python
      -- 1. Make sure to have a venv activated
      -- 2. Bootstrap the venv with `!pip3 install neovim pyright debugpy isort` in your current py env
      'pyright',
      'black',
      'debugpy',
      'flake8',
      'isort',
      'mypy',
      'pylint',
    })
  end,
  require('which-key').register {
    ['<leader>l'] = { name = '[L]sp', _ = 'which_key_ignore', mode = { 'n', 'v' } },
  },
}
