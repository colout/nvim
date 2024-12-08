return {
  "GeorgesAlkhouri/nvim-aider",
  dir = "~/git/personal/nvim-plugins/nvim-aider",
  cmd = {
    "AiderTerminalToggle",
  },

  keys = {
    --{ "<leader>at", "<cmd>AiderTerminalToggle<cr>", desc = "Open Aider" },
    { "<leader>at", "<cmd>AiderTerminalToggle<cr>", desc = "Open Aider" },
    { "<leader>as", "<cmd>AiderTerminalSend<cr>", desc = "Send to Aider", mode = { "n", "v" } },
    { "<leader>ac", "<cmd>AiderQuickSendCommand<cr>", desc = "Send Command To Aider" },
    { "<leader>ab", "<cmd>AiderQuickSendBuffer<cr>", desc = "Send Buffer To Aider" },
    { "<leader>a+", "<cmd>AiderQuickAddFile<cr>", desc = "Add File to Aider" },
    { "<leader>a-", "<cmd>AiderQuickDropFile<cr>", desc = "Drop File from Aider" },
  },
  dependencies = {
    "folke/snacks.nvim",
    "nvim-telescope/telescope.nvim",
    --- The below dependencies are optional
    "catppuccin/nvim",
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "AiderTerminalOpen",
      callback = function(args)
        local buf = args.data.buf
        vim.keymap.set("n", "<Esc>", function()
          require("nvim_aider.terminal").toggle()
        end, { buffer = buf, silent = true })

        -- remove existing keymap for ctrl-s
        vim.keymap.set({ "t", "n", "i", "v" }, "<c-s>", function()
          require("nvim_aider.terminal").toggle()
        end, { buffer = buf, silent = true })
      end,
    })
  end,
  opts = {
    args = {
      "--stream",
      "--no-show-model-warnings",
      "--model",
      "openai/qwen2.5-coder:medium-context",
    },
    win = {
      style = "nvim_aider",
      position = "float",
    },
  },
}

-- return {
--   "GeorgesAlkhouri/nvim-aider",
--   cmd = {
--     "AiderTerminalToggle",
--   },
--
--   keys = {
--     --{ "<leader>at", "<cmd>AiderTerminalToggle<cr>", desc = "Open Aider" },
--     { "<leader>at", "<cmd>AiderTerminalToggle<cr>", desc = "Open Aider" },
--     { "<leader>as", "<cmd>AiderTerminalSend<cr>", desc = "Send to Aider", mode = { "n", "v" } },
--     { "<leader>ac", "<cmd>AiderQuickSendCommand<cr>", desc = "Send Command To Aider" },
--     { "<leader>ab", "<cmd>AiderQuickSendBuffer<cr>", desc = "Send Buffer To Aider" },
--     { "<leader>a+", "<cmd>AiderQuickAddFile<cr>", desc = "Add File to Aider" },
--     { "<leader>a-", "<cmd>AiderQuickDropFile<cr>", desc = "Drop File from Aider" },
--   },
--   dependencies = {
--     "folke/snacks.nvim",
--     "nvim-telescope/telescope.nvim",
--     --- The below dependencies are optional
--     "catppuccin/nvim",
--   },
--   end,
--
--   opts = {
--     args = {
--       "--stream",
--       "--no-show-model-warnings",
--       "--model",
--       "openai/qwen2.5-coder:medium-context"
--     },
--   win = {
--     style = "nvim_aider",
--     position = "float",
--   },
--   },
--
-- }

--return { "nekowasabi/aider.vim"
--  , dependencies = "vim-denops/denops.vim"
--  , config = function()
--    -- vim.g.aider_command = 'aider --model bedrock/anthropic.claude-3-5-sonnet-20241022-v2:0 --editor-model bedrock/anthropic.claude-3-5-sonnet-20241022-v2:0 --weak-model bedrock/anthropic.claude-3-5-haiku-20241022-v1:0'
--    vim.g.aider_command = 'aider --no-show-model-warnings --model openai/qwen2.5-coder:medium-context'
--    vim.g.aider_buffer_open_type = 'floating'
--    vim.g.aider_floatwin_width = 120
--    vim.g.aider_floatwin_height = 65
--
--    vim.api.nvim_create_autocmd('User',
--      {
--        pattern = 'AiderOpen',
--        callback =
--            function(args)
--              vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { buffer = args.buf })
--              vim.keymap.set('n', '<Esc>', '<cmd>AiderHide<CR>', { buffer = args.buf })
--            end
--      })
--    vim.api.nvim_set_keymap('n', '<leader>at', ':AiderRun<CR>', { noremap = true, silent = true })
--    vim.api.nvim_set_keymap('n', '<leader>aa', ':AiderAddCurrentFile<CR>', { noremap = true, silent = true })
--    vim.api.nvim_set_keymap('n', '<leader>ar', ':AiderAddCurrentFileReadOnly<CR>', { noremap = true, silent = true })
--    vim.api.nvim_set_keymap('n', '<leader>aw', ':AiderAddWeb<CR>', { noremap = true, silent = true })
--    vim.api.nvim_set_keymap('n', '<leader>ax', ':AiderExit<CR>', { noremap = true, silent = true })
--    vim.api.nvim_set_keymap('n', '<leader>ai', ':AiderAddIgnoreCurrentFile<CR>', { noremap = true, silent = true })
--    vim.api.nvim_set_keymap('n', '<leader>aI', ':AiderOpenIgnore<CR>', { noremap = true, silent = true })
--    vim.api.nvim_set_keymap('n', '<leader>aI', ':AiderPaste<CR>', { noremap = true, silent = true })
--    vim.api.nvim_set_keymap('n', '<leader>ah', ':AiderHide<CR>', { noremap = true, silent = true })
--    vim.api.nvim_set_keymap('v', '<leader>av', ':AiderVisualTextWithPrompt<CR>', { noremap = true, silent = true })
--  end
--  }
