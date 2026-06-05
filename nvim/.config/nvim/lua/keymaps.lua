-- Native Incremental Selection for Neovim 0.12 stable
-- In Normal Mode, hitting Enter drops you into Visual Mode
vim.keymap.set("n", "<CR>", "v", { remap = true, desc = "Init incremental selection" })

-- In Visual Mode, hitting Enter expands to the parent node (an = "around node")
vim.keymap.set("x", "<CR>", "an", { remap = true, desc = "Increment selection" })

-- In Visual Mode, hitting Backspace shrinks to the child node (in = "inner node")
vim.keymap.set("x", "<BS>", "in", { remap = true, desc = "Decrement selection" })
