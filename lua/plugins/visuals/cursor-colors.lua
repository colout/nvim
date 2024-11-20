return {
  "mvllow/modes.nvim",
  opts = {
    colors = {
      copy = "yellow",
      delete = "red",
      insert = "#83b484",
      visual = "#c79dbf",
    },

    -- Set opacity for cursorline and number background
    line_opacity = 0.4,
    set_cursor = true,
    set_cursorline = true,
    set_number = true,

    ignore_filetypes = { "NvimTree", "TelescopePrompt" },
  },
}
