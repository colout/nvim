return {
  'epwalsh/obsidian.nvim',

  version = '*', -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = 'marksman',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>on',  '<cmd>ObsidianNew<cr>',         desc = '[O]bsidian [N]ew Note' },
    { '<leader>oo',  '<cmd>ObsidianSearch<cr>',      desc = '[O]bsidian [O]pen/Create Note' },
    { '<leader>oq',  '<cmd>ObsidianQuickSwitch<cr>', desc = '[O]bsidian [Q]uick Switch' },
    { '<leader>ot',  '<cmd>ObsidianTags<cr>',        desc = '[O]bsidian [T]ag Search' },
    { '<leader>odt', '<cmd>ObsidianToday<cr>',       desc = '[O]bsidian [D]ailies [T]oday' },
    { '<leader>odT', '<cmd>ObsidianTomorrow<cr>',    desc = '[O]bsidian [D]ailies [s-T]omorrow' },
    { '<leader>ody', '<cmd>ObsidianYesterday<cr>',   desc = '[O]bsidian [D]ailies [Y]esterday' },
  },

  require('which-key').register {
    ['<leader>o'] = { name = '[O]bsidian', _ = 'which_key_ignore' },
    ['<leader>od'] = { name = '[O]bsidian [D]ailies', _ = 'which_key_ignore' },
  },
  opts = function()
    local workspaces = {
      name = 'personal',
      path = '~/obsidian/personal',
    }

    -- My work macbook should have my work workspace
    if vim.g.system_id == 'Darwin' then
      workspaces = {
        name = 'work',
        path = '~/obsidian/work',
      }
    end

    return {
      workspaces = { workspaces },

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
        ['<leader>og'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { buffer = true, desc = '[O]bsidian [G]oto File (or link)' },
        },
      },
    }
  end,
}
