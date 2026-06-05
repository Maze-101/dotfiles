----------------------------
----        Lazy        ----
----------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                palette_overrides = {
                    dark0 = "#1b1b1b",
                },
                overrides = {
                    -- Force the sign column and line numbers to use your new background
                    SignColumn = { bg = "#1b1b1b" },
                    LineNr = { bg = "#1b1b1b" },
                    CursorLineNr = { bg = "#1b1b1b" }, -- The active line number
                }
            })
            vim.cmd.colorscheme("gruvbox")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        -- Force lazy.nvim to pull the rewritten, 0.12-compatible branch
        branch = "main",
        build = ":TSUpdate",
        -- Note: The old 'main = "nvim-treesitter.configs"' is dead. 
        -- We target the top-level module now.
        main = "nvim-treesitter",

        init = function()
            -- 1. Enable Native Highlighting and Indentation via Autocommand
            -- The old 'highlight = { enable = true }' setup table is gone.
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    -- Safely start Neovim's native tree-sitter engine
                    pcall(vim.treesitter.start)
                    -- Use the plugin's native indentation engine
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })

            -- 2. Handle 'ensure_installed' replacement
            -- 'ensure_installed' is no longer an automated table option. 
            -- This init logic checks what you want vs what you have, and installs the missing ones.
            local ensure_installed = { "lua", "python", "typescript", "javascript", "rust", "tsx", "c", "cpp", "go", "bash", "java" }

            local ts_config = require("nvim-treesitter.config")
            local ts_main = require("nvim-treesitter")

            -- Diffs your list against already compiled parsers so it doesn't trigger on every startup
            local installed = ts_config.get_installed()
            local to_install = {}
            for _, lang in ipairs(ensure_installed) do
                if not vim.tbl_contains(installed, lang) then
                    table.insert(to_install, lang)
                end
            end

            if #to_install > 0 then
                ts_main.install(to_install)
            end
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        keys = {
            { "af", mode = {"x", "o"}},
            { "if", mode = {"x", "o"}},
            { "ac", mode = {"x", "o"}},
            { "ic", mode = {"x", "o"}},
            { "as", mode = {"x", "o"}},
        },
        config = function()
            -- You configure it out here on its own, calling its own module setup
            require("nvim-treesitter-textobjects").setup({
                select = {
                    enable = true,
                    lookahead = true,
                },
            })

            local select = require("nvim-treesitter-textobjects.select").select_textobject

            vim.keymap.set({"x" , "o"}, "af", function()
                select("@function.outer", "textobjects")
            end)
            vim.keymap.set({"x" , "o"}, "if", function()
                select("@function.inner", "textobjects")
            end)
            vim.keymap.set({"x" , "o"}, "ac", function()
                select("@class.outer", "textobjects")
            end)
            vim.keymap.set({"x" , "o"}, "ic", function()
                select("@class.inner", "textobjects")
            end)
            vim.keymap.set({"x" , "o"}, "as", function()
                select("@local.scope", "locals")
            end)
        end,
    },
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

            -- 1. Run the standard mason-lspconfig setup first
            mason_lspconfig.setup({
                ensure_installed = { "lua_ls", "clangd" }, -- add your servers here
            })

            -- 2. Get the list of all servers you have installed via Mason
            local installed_servers = mason_lspconfig.get_installed_servers()

            -- 3. Loop through them and set them up using the new native API
            for _, server in ipairs(installed_servers) do
                -- Pull default server data from nvim-lspconfig
                local cfg = vim.lsp.config[server]

                if cfg then
                    -- Apply clangd-specific overrides if this is clangd
                    if server == "clangd" then
                        cfg.cmd = {
                            "clangd",
                            "--background-index",
                            "--clang-tidy",
                            "--fallback-style=llvm",
                        }
                    end

                    -- Optional: Apply global capabilities (like blink.cmp or nvim-cmp) to ALL servers
                    -- cfg.capabilities = require('blink.cmp').get_lsp_capabilities()

                    -- Formally register and dynamic-enable the server natively
                    vim.lsp.config(server, cfg)
                    vim.lsp.enable(server)
                end
            end
        end,
    },
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        event = { "InsertEnter", "CmdwinEnter" },
        version = "1.*",
        opts = {
            keymap = { preset = "super-tab" },

            appearance = {
                nerd_font_variant = "mono"
            },

            completion = { documentation = { auto_show = true } },

            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "echasnovski/mini.pairs",
        version = false,
        config = function()
            -- Just calling setup() with no arguments automatically sets up 
            -- (), [], {}, "", '', and `` with proper cursor positioning and deletion!
            require("mini.pairs").setup({
                modes = { insert = true, command = false, terminal = false },
            })
        end,
    },
})

-- colorscheme
vim.cmd("colorscheme gruvbox")
