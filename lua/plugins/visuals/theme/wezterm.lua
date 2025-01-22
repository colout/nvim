return {
  "colout/wezterm-theme-loader.nvim",

  dependencies = { "tjdevries/colorbuddy.nvim" },
  --dev = true,
  --dir = "~/git/personal/nvim-plugins/wezterm-theme-loader.nvim",

  lazy = false,
  priority = 1000,
  opts = {},
  init = function(plugin)
    --local home = os.getenv("HOME")
    --local wezterm_config = home .. "/.config/wezterm/wezterm.lua"
    --local f = io.open(wezterm_config, "r")
    --if f then
    --  local content = f:read("*all")
    --  f:close()
    --  -- Find all matches and take the last one
    --  local last_theme
    --  for theme in content:gmatch('config.color_scheme%s*=%s*"(.-)"') do
    --    last_theme = theme
    --  end
    --  if last_theme then
    --    plugin.opts.theme_name = last_theme
    --  end
    --end
    plugin.opts.theme_name = "Gruvbox dark, pale (base16)"

    vim.cmd("hi TermCursor guifg=green")
  end,
}
