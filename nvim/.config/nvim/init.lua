require("config.options")
require("config.keymaps")
require("config.lazy")

vim.diagnostic.config({
  virtual_lines = false, -- Disables multi-line tree display below the code
  virtual_text = true,   -- Enables inline diagnostics on the same line
})
