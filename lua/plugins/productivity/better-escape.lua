-- jj escape insert mode, but no delay on displaying the character
return {
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup()
  end,
}
