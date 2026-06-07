require("options")
require("lazy-nvim")
require("keymaps")

vim.diagnostic.config({
--   virtual_text = {
--       spacing = 4,
--       prefix = '●', -- Could also be '■', 'Points', etc.
--   },
    virtual_lines = true
})
