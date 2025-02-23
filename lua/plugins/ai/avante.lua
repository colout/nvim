return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    -- "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot"
    provider = "openai",
    --auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot

    openai = {
      --api_key_name = { vim.fn.expand("$HOME") .. "/.config/nvim/get_secret.sh", "chatgpt" },
      api_key_name = { vim.fn.expand("$HOME") .. "/.config/nvim/get_secret.sh", "work_key" },
      endpoint = vim.fn
        .system(vim.fn.expand("$HOME") .. "/.config/nvim/get_secret.sh " .. "work_endpoint")
        :gsub("\n$", ""),
      model = "bedrock/anthropic.claude-3-5-sonnet-20241022-v2:0",
    },
    --claude = {
    --  api_key_name = { vim.fn.expand("$HOME") .. "/.config/nvim/get_secret.sh", "anthropic" },
    --},

    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    -- add any opts here
    mappings = {
      ask = "<leader>aaa", -- ask
      edit = "<leader>aae", -- edit
      refresh = "<leader>aar", -- refresh
      focus = "<leader>aaf",
      toggle = {
        default = "<leader>aat",
        debug = "<leader>aad",
        hint = "<leader>aah",
        suggestion = "<leader>aas",
        repomap = "<leader>aaR",
      },
    },
    windows = {
      -- Override window options here
      wrap = true, -- for example, to enable text wrapping
      spell = false,
      signcolumn = "yes",
      foldcolumn = "0",
      number = false,
      relativenumber = false,
      list = false,
      linebreak = true,
      breakindent = true,
      cursorline = true,
      fillchars = "eob: ",
      winhighlight = "",
      winbar = "",
      statusline = "",
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",

  init = function()
    -- By default, it uses lsp, then git, then cwd, which froze my terminal or made relative paths wrong 😵
    vim.g.root_spec = { "cwd" } -- This will only use the current working directory

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "Avante",
      callback = function(ev)
        -- Clear the winhighlight setting for the Avante window
        vim.wo[vim.fn.bufwinid(ev.buf)].winhighlight = ""
      end,
    })
  end,
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = false,
        },
        file_selector = {
          provider = "telescope",
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
