require("lib.greek_keys")

-- Put result of search on center of screen
vim.keymap.set('', 'n', 'nzzzv')
vim.keymap.set('', 'N', 'Nzzzv')

-- Page up/down with cursor at the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move highlighted lines
vim.keymap.set("v", "<DOWN>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<UP>", ":m '<-2<CR>gv=gv")

-- Paste over highlighted area without overriding register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Delete to the void register
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- Don't keep stuff replaced by c
vim.keymap.set('n', 'c', '"_c')

-- Split navigation shortcuts
vim.keymap.set('', '<C-n>', ':vnew<cr>')
vim.keymap.set('', '<C-s>', ':new<cr>')

-- Replace all
vim.keymap.set('n', '<leader>ra', ':%s//g<Left><Left>')

-- Replace word
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Disable Q
vim.keymap.set('', 'Q', '<nop>')

-- Compile document, be it groff/LaTeX/ markdown/etc.
vim.keymap.set('', '<leader>c', ':w! | !compiler "<c-r>%"<cr>')

-- Open corresponding .pdf/.html or preview
vim.keymap.set('', '<leader>o', ':!opout <cr>%<cr><cr>')

-- Spell-check
vim.keymap.set('', '<leader>s', ':setlocal spell! spelllang=en,el')

-- Save file as sudo if it requires root permission
vim.keymap.set('c', 'w!!', 'execute "silent! write !sudo tee % >/dev/null" <bar> edit!')

-- Perform dot command over visual blocks
vim.keymap.set('v', '.', ':normal .<cr>')

-- Reload config
vim.keymap.set('n', '<leader><cr>', ':so $HOME/.config/nvim/init.lua<cr>')

-- Make file executable
vim.keymap.set('n', '<leader>x', ':silent !chmod +x "%"<cr>')
