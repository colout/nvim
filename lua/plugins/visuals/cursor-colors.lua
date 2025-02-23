return {
  "mvllow/modes.nvim",
  --dir = "~/git/personal/nvim-plugins/test/modes.nvim",
  opts = {
    colors = {
      copy = "yellow",
      delete = "red",
      insert = "green",
      visual = "purple",
      --insert = "#83b484",    -- lighter
      --insert = "#396039", -- darker
      -- visual = "#c79dbf",   -- ligher
      -- visual = "#824a78", -- darker
    },

    -- Set opacity for cursorline and number background
    line_opacity = 0.4,
    set_cursor = true,
    set_cursorline = true,
    set_number = true,
    enable_colored_nofile = true,

    ignore_filetypes = {},
  },
}
