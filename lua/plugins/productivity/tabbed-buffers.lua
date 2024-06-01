return {

  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    dependencies = 'echasnovski/mini.bufremove',
    opts = {
      options = {
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = true,

        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return '(' .. count .. ')'
        end,
      },
    },
    config = function(_, opts)
      local nmap = function(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { desc = desc })
      end

      require('bufferline').setup(opts)

      nmap('<s-tab>', '<cmd>bp<cr>', 'Previous buffer')
      nmap('<tab>', '<cmd>bn<cr>', 'Next Buffer ')
      nmap('<leader>bd', '<cmd>bd<cr>', '[B]uffer [D]elete')
    end,
  },
}
