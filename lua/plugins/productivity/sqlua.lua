return {
  "xemptuous/sqlua.nvim",
  lazy = true,
  cmd = "SQLua",
  init = function()
    vim.keymap.set("n", "<leader>S", "<cmd>SQLua<cr>", { desc = "[S]QLua" })
  end,
  config = function()
    require("sqlua").setup()
  end,
  opts = {
    db_save_location = "~/.local/share/nvim/sqlua/",
    connections_save_location = "~/.local/share/nvim/sqlua/connections.json",
    default_limit = 200,
    load_connections_on_start = false,
    keybinds = {
      execute_query = "<leader>r",
      activate_db = "<C-a>",
    },
  },
}
