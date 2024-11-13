return {
  -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'debugloop/telescope-undo.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<c-j>'] = 'move_selection_next',
            ['<c-k>'] = 'move_selection_previous',
          },
          n = {
            ['<c-c>'] = require('telescope.actions').close,
          },
        },
      },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        undo = {
          -- telescope-undo.nvim config, see below
          require('telescope').load_extension 'undo',
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find: [H]elp' })
    vim.keymap.set(
      'n',
      '<leader>fH',
      "<cmd>lua require('telescope.builtin').help_tags ({ default_text = vim.fn.expand '<cword>' })<cr>",
      { desc = 'Find: Current word in [s-H]elp' }
    )
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find: [K]eymaps' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find: [F]iles' })
    vim.keymap.set(
      'n',
      '<Leader>fF',
      ':lua require"telescope.builtin".find_files({ hidden = true, no_ignore = true })<CR>',
      { desc = 'Find: [F]iles (hidden)', noremap = true, silent = true }
    )
    vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = 'Find: [S]elect Telescope' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Find: Current [W]ord' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find: [G]rep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find: [D]iagnostics' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Find: [R]esume' })
    vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = 'Find: Recent Files[.]' })
    vim.keymap.set('n', '<leader>fu', '<cmd>Telescope undo<cr>', { desc = 'Find: [U]ndo' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>f/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = 'Find: [/] in Open Files' })

    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Find: [N]eovim files' })
  end,

  require('which-key').add {
    { '<leader>f', desc = '[F]ind' },
  },
}
