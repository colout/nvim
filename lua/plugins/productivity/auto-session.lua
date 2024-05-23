return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    {
      '<leader>fS',
      function()
        require('auto-session.session-lens').search_session()
      end,
      desc = '[F]ind neovim [s-S]ession',
    },
  },
  config = function()
    require('auto-session').setup {
      session_lens = {},
      pre_save_cmds = {
        'DBUIClose',
      },
    }
  end,
}
