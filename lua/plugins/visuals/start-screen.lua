return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
      [[                    _______                    ]],
      [[                  /         \                  ]],
      [[                /             \                ]],
      [[               /               \               ]],
      [[              |                 |              ]],
      [[              |                 |              ]],
      [[              |                 |              ]],
      [[               \               /               ]],
      [[                \   *     *   /                ]],
      [[                 )           (                 ]],
      [[                /             \                ]],
      [[    ---___    -                 -    ___---    ]],
      [[  /       ---    _^    ^    ^_    ---       \  ]],
      [[ |     -     _-- /    / \    \ --_     -     | ]],
      [[ (    /    --        /   \        --    \    ) ]],
      [[     /    /    /    /     \    \    \    \     ]],
      [[    .    (__  /    /       \    \  __)    .    ]],
      [[    /\    ---     /   ___   \     ---    /\    ]],
      [[   (  \ _ _   ) /   /     \   \ (   _ _ /  )   ]],
      [[    \         -    (       )    -         /    ]],
      [[      -- _ -       \       /       - _ --      ]],
      [[                    )     (                    ]],
      [[                  \-       -/                  ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button('SPC f S', '󰨭  Search sessions', "<cmd>lua require('auto-session.session-lens').search_session()<cr>"),
      dashboard.button('SPC s l', '  Open last session', "<cmd>lua require('auto-session').RestoreSession(vim.fn.getcwd())<cr>"),
      dashboard.button('e', '  New file', '<cmd>ene <CR>'),
    }
    alpha.setup(dashboard.config)
  end,
}
