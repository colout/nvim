return {
  "colout/wezterm-theme-loader.nvim",

  dependencies = { "tjdevries/colorbuddy.nvim" },
  dev = true,
  dir = "~/git/personal/nvim-plugins/wezterm-theme-loader.nvim",

  lazy = false,
  priority = 1000,
  opts = {},
  init = function(plugin)
    local home = os.getenv("HOME")
    local wezterm_config = home .. "/.config/wezterm/wezterm.lua"
    local f = io.open(wezterm_config, "r")
    if f then
      local content = f:read("*all")
      f:close()
      -- Find all matches and take the last one
      local last_theme
      for theme in content:gmatch('config.color_scheme%s*=%s*"(.-)"') do
        last_theme = theme
      end
      if last_theme then
        plugin.opts.theme_name = last_theme
      end
    end

    vim.cmd("hi TermCursor guifg=green")
  end,
}
--return {
--  "colout/wezterm-theme-loader.nvim",
--  dev = true,
--  dir = "$HOME/git/personal/nvim-plugins/wezterm-theme-loader.nvim.original",
--  lazy = false,
--  priority = 1000,
--  opts = {
--    theme_name = "Tokyo Night", -- theme to load on startup
--  },
--
--  -- Example: Read theme from Wezterm config (last occurrence)
--  init = function(plugin)
--    local home = os.getenv("HOME")
--    local wezterm_config = home .. "/.config/wezterm/wezterm.lua"
--    local f = io.open(wezterm_config, "r")
--    if f then
--      local content = f:read("*all")
--      f:close()
--      -- Find all matches and take the last one
--      local last_theme
--      for theme in content:gmatch('config.color_scheme%s*=%s*"(.-)"') do
--        last_theme = theme
--      end
--      if last_theme then
--        plugin.opts.theme_name = last_theme
--      end
--    end
--  end,
--}
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
-- }
