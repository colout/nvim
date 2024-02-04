vim.o.background = "dark"

local c = require("vscode.colors").get_colors()
require("vscode").setup({
	transparent = false,
	italic_comments = true,
	disable_nvimtree_bg = true,
})

require("vscode").load()
