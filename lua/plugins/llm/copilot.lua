return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      vim.keymap.set('n', '<leader>acp', '<cmd>Copilot panel<CR>', { desc = 'Copilot: Open [P]anel' })

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

      vim.keymap.set('n', '<leader>act', '<cmd>Copilot toggle<CR>', { desc = 'Copilot: [T]oggle' })
      vim.keymap.set('n', '<leader>acc', '<cmd>CopilotChatToggle<CR>', { desc = 'Copilot: [C]hat' })
      vim.keymap.set({ 'n', 'v' }, '<leader>acf', '<cmd>CopilotChatFix<CR>', { desc = 'Copilot: [F]ix' })
      vim.keymap.set({ 'n', 'v' }, '<leader>acx', '<cmd>CopilotChatExplain<CR>', { desc = 'Copilot: e[X]plain' })
      vim.keymap.set({ 'n', 'v' }, '<leader>acr', '<cmd>CopilotChatReview<CR>', { desc = 'Copilot: [R]eview' })
      vim.keymap.set({ 'n', 'v' }, '<leader>aco', '<cmd>CopilotChatOptimize<CR>', { desc = 'Copilot: [O]ptimize' })
      vim.keymap.set({ 'n', 'v' }, '<leader>acd', '<cmd>CopilotChatDocs<CR>', { desc = 'Copilot: Add [D]ocumentation Comment' })
      vim.keymap.set({ 'n', 'v' }, '<leader>acgc', '<cmd>CopilotChatCommit<CR>', { desc = 'Copilot: Generate git [C]ommit message' })
      vim.keymap.set({ 'n', 'v' }, '<leader>acgs', '<cmd>CopilotChatCommitStaged<CR>', { desc = 'Copilot: Generate git commit [S]taged message' })
    end,
    require('which-key').add {
      { '<leader>acg', desc = '[C]opilot [G]it commands' },
    },
  },
}
