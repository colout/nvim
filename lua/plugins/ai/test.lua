return {
  "colout/langchain-assistant.nvim",
  dev = true,
  dir = "~/git/personal/nvim-plugins/langchain-assistant/",
  dependencies = {
    "neovim/pynvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("langchain-assistant").setup({
      anthropic_api_key = vim.fn.system("~/.config/nvim/get_secret.sh anthropic"):gsub("%s+$", ""),
    })
  end,
}
