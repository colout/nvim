return {
  {
    'jackMort/ChatGPT.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'folke/trouble.nvim',
      'folke/which-key.nvim',
      'nvim-telescope/telescope.nvim',
    },
    event = 'VeryLazy',
    config = function()
      require('chatgpt').setup {
        api_key_cmd = vim.fn.expand '$HOME' .. '/.config/nvim/get_secret.sh chatgpt',
      }
      vim.keymap.set({ 'n', 'v' }, '<leader>age', require('chatgpt').edit_with_instructions, { desc = '[A]i Chat[G]PT [E]dit with instructions' })
      vim.keymap.set('n', '<leader>ago', require('chatgpt').openChat, { desc = '[A]i Chat[G]PT [O]pen chat' })
      vim.keymap.set({ 'n', 'v' }, '<leader>ago', require('chatgpt').openChat, { desc = '[A]i Chat[G]PT [O]pen chat' })
    end,
    require('which-key').register {
      ['<leader>a'] = { '[A]i' },
      { mode = { 'v', 'n' } },
      ['<leader>ag'] = { '[A]i Chat[G]PT' },
      { mode = { 'v', 'n' } },
      ['<leader>ac'] = { '[A]i [C]opilot' },
      { mode = { 'v', 'n' } },
    },
  },
}
