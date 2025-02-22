vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.showmode = false
vim.opt.wrap = false

-- Enable break indent
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- Forces ALL tabs to be spaces

vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.ruler = true
vim.opt.showcmd = false -- Don't show previous key

vim.opt.incsearch = true
vim.opt.backup = false

vim.opt.swapfile = false

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Decrease update time
vim.opt.updatetime = 50

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
--vim.opt.timeoutlen = 250 -- Also affects how long to wait after esc...keep this reasonable to allow double escape to register
vim.opt.timeoutlen = 500 -- Also affects how long to wait after esc and how quick diff commands work with avante (co, ct). This gives more time to accept the diff
--vim.opt.timeout = false -- disable timeout since it's annoying.  ignore the line above.  that's disabled when this is false

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- To properly format obsidian (and hides markdown details)
--   Also can be toggled in keymaps (see the keymaps.lua file)
vim.opt.conceallevel = 1
vim.opt_local.conceallevel = 2

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.opt.cursorline = true

-- views can only be fully collapsed with the global statusline
-- from https://github.com/yetone/avante.nvim
vim.opt.laststatus = 3

-- Cursor overrides
--vim.api.nvim_set_hl(0, "rCursor", { fg = "#d70000", ctermbg = 124 }) -- Modes plugin will handle the per-mode color settings though
vim.opt.guicursor = "n-v-c-sm-i-ci-ve:block,a:blinkon150-blinkoff150-blinkwait150,r-cr-o:hor20"

vim.g.netrw_banner = 0 -- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split = 4 -- open in prior window
vim.g.netrw_altv = 1 -- change from left splitting to right splitting
vim.g.netrw_liststyle = 3 -- tree style view in netrw

--vim.opt.completeopt = { "menuone", "noselect" }
