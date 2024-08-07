local chatgpt_model = 'gpt-4-turbo' -- 128,000 tokens
--local chatgpt_model = 'gpt-4' -- 8,192 tokens
--local chatgpt_model = 'gpt-3.5-turbo' -- 16,385 tokens
--local chatgpt_model = 'gpt-4o' -- 128,000 tokens

return {
  {
    'jackMort/ChatGPT.nvim',
    dependencies = {
      'folke/which-key.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'folke/trouble.nvim',
      'nvim-telescope/telescope.nvim',
    },
    event = 'VeryLazy',
    config = function()
      require('chatgpt').setup {
        api_key_cmd = vim.fn.expand '$HOME' .. '/.config/nvim/get_secret.sh chatgpt',

        openai_params = {
          frequency_penalty = 0,
          model = chatgpt_model,
          presence_penalty = 0,
          max_tokens = 300,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
        openai_edit_params = {
          model = chatgpt_model,
          frequency_penalty = 0,
          presence_penalty = 0,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
      }

      vim.keymap.set({ 'v' }, '<leader>age', require('chatgpt').edit_with_instructions, { desc = 'AI ChatGPT: [E]dit with instructions' })

      vim.keymap.set({ 'v' }, '<leader>agr', '<cmd>ChatGPTRun code_readability_analysis<CR>', { desc = 'AI ChatGPT: Code [R]eadability Analysis' })

      vim.keymap.set({ 'v' }, '<leader>agb', '<cmd>ChatGPTRun fix_bugs<CR>', { desc = 'AI ChatGPT: Fix [B]ugs' })

      vim.keymap.set({ 'v' }, '<leader>ags', '<cmd>ChatGPTRun summarize<CR>', { desc = 'AI ChatGPT: [S]ummarize' })

      vim.keymap.set({ 'v' }, '<leader>agx', '<cmd>ChatGPTRun explain_code<CR>', { desc = 'AI ChatGPT: e[X]plain code' })

      vim.keymap.set({ 'v' }, '<leader>ago', '<cmd>ChatGPTRun optimize_code<CR>', { desc = 'AI ChatGPT: [O]ptimize' })

      vim.keymap.set('n', '<leader>agc', require('chatgpt').openChat, { desc = 'AI ChatGPT: Open [C]hat' })
      vim.keymap.set('n', '<leader>agp', require('chatgpt').selectAwesomePrompt, { desc = 'AI ChatGPT: [P]rompt' })
    end,

    require('which-key').register {
      mode = { 'v', 'n' },
      ['<leader>a'] = { name = '[A]i', _ = 'which_key_ignore' },
      ['<leader>ag'] = { name = 'AI: Chat[G]PT', _ = 'which_key_ignore' },
      ['<leader>ac'] = { name = 'AI: [C]opilot', _ = 'which_key_ignore' },
    },
  },
}
