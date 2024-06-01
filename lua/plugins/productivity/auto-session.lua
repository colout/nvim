return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    {
      '<leader>fS',
      function()
        require('auto-session.session-lens').search_session()
      end,
      desc = 'Find: [s-S]ession',
    },
  },
  config = function()
    require('auto-session').setup {
      session_lens = {},
      pre_save_cmds = {
        --'DBUIClose',
      },
      auto_restore_enabled = false,
      auto_session_enabled = true,
      auto_save_enabled = true,
    }
  end,
}
