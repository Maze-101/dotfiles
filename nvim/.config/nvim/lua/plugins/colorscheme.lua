return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Load this first
    config = function()
      -- Hook into colorscheme loading to inject our custom background
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "gruvbox",
        callback = function()
          vim.api.nvim_set_hl(0, "Normal", { bg = "#1b1b1b" })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1b1b1b" })
        end,
      })

      -- Load the colorscheme
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}