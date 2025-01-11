return {
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,

    keys = {
      { "<leader>gl", "<cmd>LazyGit<cr>", desc = "[L]azyGit" },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
      "echasnovski/mini.pick", -- optional
    },
    config = true,
    integrations = {
      diffview = true,
      telescope = true,
    },
    keys = {
      { "<leader>gn", "<cmd>Neogit kind=floating<cr>", desc = "[N]eoGit" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "folke/which-key.nvim",
      { "akinsho/git-conflict.nvim", version = "*", config = true },
    },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "󰦒" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "✭" },
      },
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 200,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        gitsigns.setup = {
          vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#888888", bg = "NONE" }),
        }

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "Jump to next git [c]hange" })

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "Jump to previous git [c]hange" })

        -- Actions
        -- visual mode
        map("v", "<leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "stage git hunk" })
        map("v", "<leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "reset git hunk" })
        -- normal mode
        map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "git [H]unk [s]tage hunk" })
        map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "git [H]unk [r]eset hunk" })
        map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "git [H]unk [S]tage buffer" })
        map("n", "<leader>ghu", gitsigns.undo_stage_hunk, { desc = "git [H]unk [u]ndo stage hunk" })
        map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "git [H]unk [R]eset buffer" })
        map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "git [H]unk [p]review hunk" })
        map("n", "<leader>ghb", gitsigns.blame_line, { desc = "git [H]unk [b]lame line" })
        map("n", "<leader>ghd", gitsigns.diffthis, { desc = "git [H]unk [d]iff against index" })
        map("n", "<leader>ghD", function()
          gitsigns.diffthis("@")
        end, { desc = "git [H]unk [D]iff against last commit" })
        -- Toggles
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle show git [B]lame line" })
        map("n", "<leader>tD", gitsigns.toggle_deleted, { desc = "[T]oggle show git [D]eleted hunk" })
      end,
    },
  },
}
