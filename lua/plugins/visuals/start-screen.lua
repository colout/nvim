
return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim'
    },
    config = function ()
      alpha = require'alpha'
      dashboard = require'alpha.themes.dashboard'

      dashboard.section.buttons.val = {
        dashboard.button("SPC s l", "  Open last session", "<cmd>SessionRestore<cr>"),
        dashboard.button("e", "  New file", "<cmd>ene <CR>"),
      }
      alpha.setup(dashboard.config)
    end
};
