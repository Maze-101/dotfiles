-- Set leader key to Spacebar before anything else loads
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers 
vim.opt.shiftwidth = 4        -- Size of an indent
vim.opt.tabstop = 4           -- Number of spaces tabs count for
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.termguicolors = true  -- True color support
vim.opt.ignorecase = true     -- Ignore case when searching...
vim.opt.smartcase = true      -- ...unless search contains a capital letter
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.scrolloff = 10
vim.opt.virtualedit = "block"
