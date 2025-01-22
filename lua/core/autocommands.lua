-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable auto-indent on ':' with python (annoying if typing in an open string)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    --vim.opt_local.indentkeys:remove("<:>")
    --vim.opt_local.indentkeys:remove("=:")
    vim.opt_local.indentkeys = "" -- ok... : is annoying but other keys triggerr indenting
  end,
})
