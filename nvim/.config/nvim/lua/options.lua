
-- relative-numbered lines
vim.opt.number = true
vim.opt.relativenumber = true

-- new horizontal/vertical windows
-- are below/beside the main window
vim.opt.splitbelow = true
vim.opt.splitright = true

-- disables line wrapping
vim.opt.wrap = false

-- treats tabs as 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- sync nvim clipboard with system clipboard
vim.opt.clipboard = "unnamedplus"

-- cursor in the middle while scrolling
vim.opt.scrolloff = 999

-- splits the screen to show a preview
-- for the edited version
vim.opt.inccommand = "split"

-- treats the whole window as adjacent cells 
-- in visual block mode
vim.opt.virtualedit = "block"

-- ignores the case for the neovim built-in
-- plugins while searching
vim.opt.ignorecase = true

-- shows true saturated colors
vim.opt.termguicolors = true

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
