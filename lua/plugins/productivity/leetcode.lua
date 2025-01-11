return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
    "nvim-telescope/telescope.nvim",
    -- "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    image_support = false, -- Enabling this will disable question description wrap, because of https://github.com/3rd/image.nvim/issues/62#issuecomment-1778082534
    lang = "python3", -- "cpp",
    hooks = {
      ---@type fun()[]
      ["enter"] = function()
        vim.diagnostic.enable(false)
        local leetcode_run_on_save = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
          group = leetcode_run_on_save,
          callback = function()
            require("leetcode.command").q_run()
            vim.api.nvim_input("<C-w>w") -- focus next window
          end,
        })
      end,
    },
    keys = {
      toggle = { "q" }, ---@type string|string[]
      confirm = { "<CR>" }, ---@type string|string[]

      reset_testcases = "r", ---@type string
      use_testcase = "U", ---@type string
      focus_testcases = "H", ---@type string
      focus_result = "L", ---@type string
    },
    theme = {
      --["alt"] = {
      --  bg = "#FFFFFF",
      --},
      ["normal"] = {
        fg = "white",
      },
    },
  },
}
