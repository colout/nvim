return { -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Useful status updates for LSP.
    { "j-hui/fidget.nvim", opts = {} },

    -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Replace some builtins
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

        -- Also create those builtin replacements under the lsp space
        map("<leader>lgr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("<leader>lgi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        map("<leader>lgD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map("<leader>lgd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        map("<leader>lgt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype definition")

        -- Some LSP commands (might be some duplicates fromt he buildins above for now...)
        map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "Document [S]ymbols")
        map("<leader>lw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace symbols")
        -- map('<leader>lK', vim.lsp.buf.hover, '[L]sp Hover Help') -- i think this is redundant to builtin K

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
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    -- :h lspconfig-all
    local servers = {

      -- dbs, data formats
      yamlls = {}, -- yaml
      jsonls = {}, -- json
      sqlls = {
        filetypes = { "mysql", "sql" },
        root_dir = function()
          return vim.loop.cwd()
        end,
      },

      -- functional, manifests
      terraformls = {}, -- terraform
      nil_ls = {}, --nix
      docker_compose_language_service = {},
      dockerls = {},
      marksman = {}, -- markdown

      -- Languages
      gopls = {}, -- golang
      lua_ls = { -- lua
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      clangd = {}, --c, cpp
      pyright = {}, -- python
    }

    for server, conf in pairs(servers) do
      require("lspconfig")[server].setup({ conf })
    end

    -- Below is completely unused
    -- ... Just leftover from my kickstart config, and I want to create some docs/automation on this later
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      -- Python
      -- 1. Make sure to have a venv activated
      -- 2. Bootstrap the venv with `!pip3 install neovim pyright debugpy isort` in your current py env
      "pyright",
      "black",
      "debugpy",
      "flake8",
      "isort",
      "mypy",
      "pylint",
    })
  end,
}
