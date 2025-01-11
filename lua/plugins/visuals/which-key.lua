return { -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require("which-key").setup()

    require("which-key").add({
      {
        "<leader>t",
        desc = "[T]oggle",
        mode = { "n", "v" },
      },
      { "<leader>l", "[L]sp", mode = { "n", "v" } },
      { "<leader>a", desc = "[A]i", mode = { "n", "v" } },
      { "<leader>aa", desc = "[A]vante", mode = { "n", "v" } },
      { "<leader>f", desc = "[F]ind" },
      { "<leader>g", desc = "[G]it" },
      { "<leader>gh", desc = "git [H]unk" },
      { "<leader>o", desc = "[O]bsidian" },
    })
  end,
}
