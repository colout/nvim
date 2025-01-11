return {
  "colout/neo-jeeves.nvim",
  dev = true,
  dir = "~/git/personal/nvim-plugins/neo-jeeves.nvim/",
  dependencies = {
    "neovim/pynvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-jeeves").setup({
      debug = true,
      anthropic_api_key = vim.fn.system("~/.config/nvim/get_secret.sh anthropic"):gsub("%s+$", ""),
    })
  end,
}
