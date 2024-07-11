return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      -- Ideally we call this from each plugin directly
    }

    require('which-key').register {
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore', mode = { 'n', 'v' } },
    }
  end,
}
