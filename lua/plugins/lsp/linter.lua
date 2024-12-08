---@type NvPluginSpec
return {
  "mfussenegger/nvim-lint",
  event = { "BufWritePost", "BufReadPost", "InsertLeave" },

  enabled = true,
  init = function()
    require("lint").linters_by_ft = {}
    local f = require("plugins.lsp.lsp_configuration.config")
    for _, c in ipairs(f) do
      require("lint").linters_by_ft[c.filetype] = c.linters
    end

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        print(require("lint").try_lint())
      end,
    })
  end,
}
