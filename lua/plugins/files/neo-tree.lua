return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree toggle<CR>', { desc = 'NeoTr[E]e toggle' } },
  },
  opts = {
    filesystem = {
      window = {
        width = 35,
        mappings = {
          ['<space>'] = '', -- please don't hijack my leader key :(
        },
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added = '+',
          deleted = '',
          modified = '󰦒',
          renamed = '➜',
          -- Status type
          untracked = '✭',
          ignored = '◌',
          unstaged = '✗',
          staged = '✔︎',
          conflict = '',
        },
      },
    },
    event_handlers = {
      { -- Close neo-tree on file open
        event = 'file_opened',
        handler = function()
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
    },
  },
}
