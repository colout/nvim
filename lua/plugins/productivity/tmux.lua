return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { mode = { "n", "i", "v", "t" }, "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
    { mode = { "n", "i", "v", "t" }, "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
    { mode = { "n", "i", "v", "t" }, "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
    { mode = { "n", "i", "v", "t" }, "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
  },
  config = function()
    vim.g.tmux_navigator_no_wrap = 1
  end,
}
