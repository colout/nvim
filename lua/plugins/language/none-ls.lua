return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    -- need to import first
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.nixfmt,

        null_ls.builtins.diagnostics.terraform_validate,
        
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.code_actions.statix,
      },
    }
  end,
  }
