return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        palette_overrides = {
          dark0 = "#1b1b1b",
        },
        overrides = {
          SignColumn = { bg = "#1b1b1b" },
          LineNr = { bg = "#1b1b1b" },
          CursorLineNr = { bg = "#1b1b1b" },
        },
      })
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
