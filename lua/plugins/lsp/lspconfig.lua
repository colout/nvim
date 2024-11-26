---@diagnostic disable: missing-fields
return {
  -- Customize LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "j-hui/fidget.nvim", opts = {} },
      { "folke/neodev.nvim", opts = {} },
    },

    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("main-lsp-attach", { clear = true }),
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
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
    end,
  },

  { import = "plugins.lsp.language" },
}
