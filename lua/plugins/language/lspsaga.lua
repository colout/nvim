return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup {}

    vim.keymap.set('n', '<leader>la', '<cmd>Lspsaga code_action<CR>', { desc = '[L]sp code [A]ctions' })
    vim.keymap.set('n', '<leader>lf', '<cmd>Lspsaga finder<CR>', { desc = '[L]sp [F]inder' })
    vim.keymap.set('n', '<leader>lh', '<cmd>Lspsaga hover_doc<CR>', { desc = '[L]sp [H]over doc' })
    vim.keymap.set('n', '<leader>lr', '<cmd>Lspsaga rename<CR>', { desc = '[L]sp [R]ename' })
    vim.keymap.set('n', '<leader>lp', '<cmd>Lspsaga peek_definition<CR>', { desc = '[L]sp [P]eek definition' })
    vim.keymap.set('n', '<leader>lg', '<cmd>Lspsaga goto_definition<CR>', { desc = '[L]sp [G]oto Definition' })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons', -- optional
  },
  opts = {
    lightbulb = {
      enable = true,
      virtualText = true,
    },
    symbol_in_winbar = {
      enable = true,
    },
    ui = {
      border = 'rounded',
    },
  },
}
