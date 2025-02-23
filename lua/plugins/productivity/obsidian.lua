return {
  "epwalsh/obsidian.nvim",

  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "marksman",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "3rd/image.nvim",
  },
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "[O]bsidian - [N]ew Note" },
    { "<leader>oo", "<cmd>ObsidianSearch<cr>", desc = "[O]bsidian - [O]pen/Create Note" },
    { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "[O]bsidian - [Q]uick Switch" },
    { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "[O]bsidian - [T]ag Search" },
    { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "[O]bsidian - New [D]aily for Today" },
    { "<leader>or", "<cmd>ObsidianRename<cr>", desc = "[O]bsidian - [R]ename This Note" },
  },

  opts = function()
    require("image").setup({
      integrations = {
        markdown = {
          resolve_image_path = function(document_path, image_path, fallback)
            local working_dir = vim.fn.getcwd()
            -- Format image path for Obsidian notes
            if working_dir:find("path/to/your/vault") then
              return working_dir .. "/" .. image_path
            end
            -- Fallback to the default behavior
            return fallback(document_path, image_path)
          end,
        },
      },
    })
    local workspaces = {
      {
        name = "personal",
        path = "~/obsidian/personal",
      },
    }

    return {
      workspaces = workspaces,
      ui = {
        enable = false,
      },

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },

      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },

      mappings = {
        ["<leader>og"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { buffer = true, desc = "[O]bsidian [G]oto File (or link)" },
        },
      },
    }
  end,
}
