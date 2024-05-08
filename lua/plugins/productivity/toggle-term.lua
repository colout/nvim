return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { '<c-s>', '<cmd>ToggleTerm<cr>', desc = 'Toggle terminal [S]hell', mode = { 'n', 't', 'i' } },
  },
  opts = {
    direction = 'float',

    float_opts = {
      border = 'curved',
      winblend = 15,
    },
  },
}
