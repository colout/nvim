return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = '[[',
            jump_next = ']]',
            accept = '<CR>',
            refresh = 'gr',
            open = '<M-CR>',
          },
          layout = {
            position = 'right', -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = '<A-y>',
            accept_word = false,
            accept_line = false,
            next = '<A-n>',
            prev = '<A-p>',
            dismiss = '<A-d>',
          },
        },
        filetypes = {
          ['*'] = true,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      }
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
      { 'zbirenbaum/copilot.lua' },
    },
    config = function()
      require('CopilotChat').setup()

      vim.keymap.set('n', '<leader>aCp', '<cmd>Copilot panel<CR>', { desc = 'Copilot: Open [P]anel' })

      vim.keymap.set('n', '<leader>aCt', '<cmd>Copilot toggle<CR>', { desc = 'Copilot: [T]oggle' })
      vim.keymap.set('n', '<leader>aCc', '<cmd>CopilotChatToggle<CR>', { desc = 'Copilot: [C]hat' })
      vim.keymap.set({ 'n', 'v' }, '<leader>aCf', '<cmd>CopilotChatFix<CR>', { desc = 'Copilot: [F]ix' })
      vim.keymap.set({ 'n', 'v' }, '<leader>aCx', '<cmd>CopilotChatExplain<CR>', { desc = 'Copilot: e[X]plain' })
      vim.keymap.set({ 'n', 'v' }, '<leader>aCr', '<cmd>CopilotChatReview<CR>', { desc = 'Copilot: [R]eview' })
      vim.keymap.set({ 'n', 'v' }, '<leader>aCo', '<cmd>CopilotChatOptimize<CR>', { desc = 'Copilot: [O]ptimize' })
      vim.keymap.set({ 'n', 'v' }, '<leader>aCd', '<cmd>CopilotChatDocs<CR>', { desc = 'Copilot: Add [D]ocumentation Comment' })
      vim.keymap.set({ 'n', 'v' }, '<leader>aCgc', '<cmd>CopilotChatCommit<CR>', { desc = 'Copilot: Generate git [C]ommit message' })
      vim.keymap.set({ 'n', 'v' }, '<leader>aCgs', '<cmd>CopilotChatCommitStaged<CR>', { desc = 'Copilot: Generate git commit [S]taged message' })

      require('which-key').add {
        { '<leader>aC', desc = '[C]opilot' },
        { '<leader>aCg', desc = '[C]opilot [G]it commands' },
      }
    end,
  },
}
