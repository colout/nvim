return {
  "folke/snacks.nvim",
  opts = {
    bigfile = {}, -- Don't LSP on 1.5MB+ files
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "n", desc = "New File", action = ":ene" },
          {
            icon = " ",
            key = "s",
            desc = "Restore Session",
            action = "<cmd>lua require('auto-session').RestoreSession(vim.fn.getcwd())<cr>",
          },
          {
            icon = "󰍉 ",
            key = "s",
            desc = "Search Session",
            action = "<cmd>lua require('auto-session.session-lens').search_session()<cr>",
          },
          { icon = "󰈞 ", key = "f", desc = "Find File", action = "<cmd>Telescope find_files<cr>" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = '<cmd>lua require("auto-session").RestoreSession(vim.fn.expand("$HOME") .. "/.config/nvim")<cr>',
          },

          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = {
          table.concat({
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
          }, "\n"),
        },
      },
    },
  },
}
