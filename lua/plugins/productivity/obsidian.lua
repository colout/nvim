return {
  'epwalsh/obsidian.nvim',

  version = '*', -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = 'marksman',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>on', '<cmd>ObsidianNew<cr>', desc = '[O]bsidian [N]ew Note' },
    { '<leader>oo', '<cmd>ObsidianSearch<cr>', desc = '[O]bsidian [O]pen/Create Note' },
    { '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>', desc = '[O]bsidian [Q]uick Switch' },
    { '<leader>ot', '<cmd>ObsidianTags<cr>', desc = '[O]bsidian [T]ag Search' },
    { '<leader>odt', '<cmd>ObsidianToday<cr>', desc = '[O]bsidian [D]ailies [T]oday' },
    { '<leader>odT', '<cmd>ObsidianTomorrow<cr>', desc = '[O]bsidian [D]ailies [s-T]omorrow' },
    { '<leader>ody', '<cmd>ObsidianYesterday<cr>', desc = '[O]bsidian [D]ailies [Y]esterday' },
  },
  opts = {
    workspaces = {
      {
        name = 'work',
        path = '~/obsidian/work',
      },
    },

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    templates = {
      folder = 'templates',
      date_format = '%Y-%m-%d-%a',
      time_format = '%H:%M',
    },

    mappings = {
      ['<leader>ogf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true, desc = '[O]bsidian [G]oto [F]ile (or link)' },
      },
    },
  },
}
