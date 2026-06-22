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

    vim.lsp.config('ts_ls', {
      handlers = {
        ["textDocument/publishDiagnostics"] = function(_, params, client_id, config)
          if params.diagnostics ~= nil then
            local idx = 1
            while idx <= #params.diagnostics do
              if params.diagnostics[idx].code == 80001 then
                table.remove(params.diagnostics, idx)
              else
                idx = idx + 1
              end
            end
          end
          vim.lsp.diagnostic.on_publish_diagnostics(_, params, client_id, config)
        end,
      },
    })

    vim.lsp.enable('ts_ls')

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
