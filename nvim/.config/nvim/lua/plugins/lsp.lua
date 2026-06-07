return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        opt = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = { "lua_ls", "clangd" },
            })

            local installed_servers = mason_lspconfig.get_installed_servers()

            for _, server in ipairs(installed_servers) do
                local cfg = vim.lsp.config[server]

                if cfg then
                    if server == "clangd" then
                        cfg.cmd = {
                            "clangd",
                            "--background-index",
                            "--clang-tidy",
                            "--fallback-style=llvm",
                        }
                    end

                    vim.lsp.config(server, cfg)
                    vim.lsp.enable(server)
                end
            end
        end,
    },
}
