return {
  {
    'kndndrj/nvim-dbee',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require('dbee').install()
    end,
    config = function()
      require('dbee').setup(--[[optional config]])
    end,
    keys = {
      {
        '<Leader>do',
        '<cmd>Dbee open<cr>',
        desc = '[D]bee [O]pen',
      },
      {
        '<Leader>dc',
        '<cmd>Dbee close<cr>',
        desc = '[D]bee [C]lose',
      },
    },
  },
}
