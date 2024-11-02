return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    require('which-key').add {
      {
        '<leader>t',
        desc = '[T]oggle',
        mode = { 'n', 'v' },
      },
    }
  end,
}
