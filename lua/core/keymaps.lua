-- Diagnostic keymaps
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', 'x', '"_x')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<Esc><Esc>', 'e:nohl<CR>', { desc = 'Clear Hilights' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Buffer stuff
vim.keymap.set('n', '<leader>db', '<cmd>%bdelete|edit #|normal`"<cr>', { desc = '[D]elete all [B]uffers except current' })

--- Diagnostic toggle code
vim.keymap.set(
  'n',
  '<leader>ld',
  '<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<cr>',
  { noremap = true, silent = true, desc = 'Toggle [L]sp [D]iagnostics' }
)
