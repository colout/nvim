-- Diagnostic keymaps
-- vim.keymap.set('n', ';', ':') -- Might add this back for qol.  ';' repeats 't' or 'f' movement
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>nh", "e:nohl<CR>", { desc = "[N]o [H]ilights" })

--vim.keymap.set("n", "<Esc><Esc>", "e:nohl<CR>", { desc = "Clear Hilights" })  -- no escape bindings please....it's laggy and buggy feeling

-- Toggle hilights
vim.keymap.set("n", "<leader>th", "e:nohl<CR>", { desc = "Clear Hilights" })

-- TIP: Disable arrow keys in normal mode
--vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
--vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
--vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
--vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Toggles
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
