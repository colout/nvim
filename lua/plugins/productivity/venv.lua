return {
  "linux-cultist/venv-selector.nvim",

  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  branch = "regexp",
  lazy = false,
  config = function()
    local function shorter_name(filename)
      return filename:gsub(os.getenv("HOME"), "~"):gsub("/bin/python", "")
    end

    require("venv-selector").setup({
      settings = {
        options = {
          on_telescope_result_callback = shorter_name,
          debug = true,
        },
        search = {
          my_venvs = {
            command = "fd python$ ~/venvs --follow | grep bin/python$",
            on_telescope_result_callback = shorter_name,
          },
        },
      },
    })
  end,
  keys = {
    { "<leader>fv", "<cmd>VenvSelect<cr>", desc = "[F]ind Python [V]Env" },
  },
}
