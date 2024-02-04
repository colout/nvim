local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- some nice defaults
opt.wrap = false
opt.cursorline = true --meh?
opt.backspace = "indent,eol,start"
opt.encoding = "utf8"

-- Starts scrolling when closer to bottom
opt.scrolloff = 8

-- appearance
opt.termguicolors = true
--opt.background = "dark"
opt.signcolumn = "yes"

-- Show more info in status bar
opt.ruler = true
opt.showcmd = true

-- Will implement search incrementally as you type
opt.incsearch = true

-- Will hilight all search results
opt.hlsearch = true

-- No swap file or temp backup backup before write
opt.swapfile = false
opt.backup = false

-- Undo persistant across sessions
vim.cmd([[
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif

set undodir=~/.vim/undo-dir
set undofile
]])

opt.undofile = true

-- Can navegate away from file and save in buffer
opt.hidden = true
