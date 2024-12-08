-- vim.keymap.set('n', ';', ':') -- Might add this back for qol.  ';' repeats 't' or 'f' movement
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<leader>nh", "e:nohl<CR>", { desc = "[N]o [H]ilights" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Toggle hilights
vim.keymap.set("n", "<leader>th", "e:nohl<CR>", { desc = "Clear Hilights" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- clipboard shortcuts TODO: not a todo, but don't foget to use these!
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])

--
-- Toggles
--
vim.keymap.set(
  "n",
  "<leader>td",
  "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<cr>",
  { noremap = true, silent = true, desc = "[T]oggle lsp [D]iagnostics" }
)

local function toggleConceal() -- Conceal formatting for markdown
  if vim.opt.conceallevel:get() == 0 then
    vim.opt.conceallevel = 1
    vim.opt_local.conceallevel = 2
  else
    vim.opt.conceallevel = 0
    vim.opt_local.conceallevel = 0
  end
end

vim.keymap.set("n", "<leader>tc", toggleConceal, { desc = "[T]oggle markdown is [C]oncealed" })

--
-- Fix annoying litte things
--

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J maintains cursor position when merging lines
vim.keymap.set("n", "J", "mzJ`z")

-- recenter on different jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- unbind ex compatibility mode
vim.keymap.set("n", "Q", "<nop>")

-- netrw
--vim.keymap.set("n", "<leader>e", ":25Lex<CR>")

-- adjust split sizes easier
vim.keymap.set("n", "<C-Left>", ":vertical resize +3<CR>") -- Control+Left resizes vertical split +
vim.keymap.set("n", "<C-Right>", ":vertical resize -3<CR>") -- Control+Right resizes vertical split -

-- Comments
vim.keymap.set("n", "<leader>c", "gcc", { remap = true, desc = "[C]omment line" })
vim.keymap.set("n", "<leader>C", "yygccp", { remap = true, desc = "[C]opy to a comment above" })
vim.keymap.set("v", "<leader>C", "ygvgc`>p", { remap = true, desc = "[C]opy to a comment above" })
