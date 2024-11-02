return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    'folke/which-key.nvim',
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'pgsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.keymap.set('n', '<leader>du', '<cmd>DBUIToggle<CR>', { desc = '[D]adbod [U]i toggle' })
    vim.keymap.set('n', '<leader>dm', '<cmd>:set filetype=mysql<CR>', { desc = '[D]b filetype [M]ysql' })
    vim.keymap.set('n', '<leader>dp', '<cmd>:set filetype=pgsql<CR>', { desc = '[D]b filetype [P]gsql' })

    vim.g.db_ui_use_nerd_fonts = 1

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'dbout' },
      command = [[setlocal nofoldenable]],
    })
  end,

  require('which-key').add {
    { '<leader>d', desc = '[D]adbod' },
  },
}
