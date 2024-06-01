return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({})

    vim.keymap.set('n', '<leader>la', '<cmd>Lspsaga code_action<CR>', { desc = 'LSP: Code [A]ctions' })
    vim.keymap.set('n', '<leader>fl', '<cmd>Lspsaga finder<CR>', { desc = 'LSP: [F]ind [L]sp' })
    vim.keymap.set('n', '<leader>lh', '<cmd>Lspsaga hover_doc<CR>', { desc = 'LSP: [H]over doc' })
    vim.keymap.set('n', '<leader>lr', '<cmd>Lspsaga rename<CR>', { desc = 'LSP: [R]ename' })
    vim.keymap.set('n', '<leader>lp', '<cmd>Lspsaga peek_definition<CR>', { desc = 'LSP: [P]eek definition' })
    vim.keymap.set('n', '<leader>ld', '<cmd>Lspsaga goto_definition<CR>', { desc = 'LSP: [G]oto definition' })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
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
