local keymap = vim.keymap.set
local opts = { silent = true }

-- Clear search highlights easily by pressing Escape
keymap("n", "<Esc>", "<cmd>noh<CR>", opts)

-- Better window navigation (Ctrl + h/j/k/l to jump between splits)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Stay in visual mode when indenting text blocks with < or >
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selected lines up and down visually (Alt + j/k)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Fast saving and quitting
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- split window vertically
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })

-- split window horizontally
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })