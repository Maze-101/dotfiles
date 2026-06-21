return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        -- Standard language servers for main languages
        ensure_installed = {
          "clangd",    -- C
          "pyright",   -- Python
          "gopls",     -- Go
          "ts_ls",     -- JS/TS
          "jdtls",     -- Java
          "lua_ls",    -- Lua
          "bashls",    -- Bash
        },
      })

      -- Automatically set up every language server installed via mason-lspconfig
      handlers = {
          function(server_name)
            lspconfig[server_name].setup({})
          end,
        },

      -- Basic LSP keymaps (Press 'K' for docs, 'gd' to go to definition)
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        end,
      })
    end,
  },
}