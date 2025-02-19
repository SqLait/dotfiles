return {
    "neovim/nvim-lspconfig",
    dependencies = {
        'saghen/blink.cmp',
        "williamboman/mason-lspconfig.nvim",
        {
            "folke/lazydev.nvim",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "lua_ls", "clangd", "csharp_ls", --[["tsserver",]]
                "rust_analyzer", "elixirls", "pyright",
            },
        })
        -- Manually set up each LSP server with capabilities
        mason_lspconfig.setup_handlers({
            -- default handler for installed servers
            function(server)
                lspconfig[server].setup({
                    capabilities = capabilities,
                    on_attach = function()
                        -- Additional on_attach logic can go here if needed
                    end,
                })
            end,
            ["clangd"] = function()
                lspconfig["clangd"].setup({
                    capabilities = capabilities,
                    cmd = { "clangd", "--compile-commands-dir=build" },
                    filetype = { "c", "cpp" },
                })
            end,
            ["csharp_ls"] = function()
                lspconfig.csharp_ls.setup({
                    capabilities = capabilities,
                })
            end,
            ["pyright"] = function()
                lspconfig.pyright.setup({
                    capabilities = capabilities,
                    settings = {
                        python = {
                            analysis = {
                                typeCheckingMode = "strict",      -- Options: off, basic, strict
                                autoSearchPaths = true,
                                diagnosticMode = "openFilesOnly", -- Options: openFilesOnly, workspace
                                useLibraryCodeForTypes = true,
                            },
                        },
                    },
                })
            end,

            ["rust_analyzer"] = function()
                lspconfig.rust_analyzer.setup({
                    capabilities = capabilities,
                })
            end,
            ["elixirls"] = function()
                lspconfig["elixirls"].setup({
                    cmd = { "elixir-ls" },
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                })
            end,
        }) -- Auto format Lua files on save
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local c = vim.lsp.get_client_by_id(args.data.client_id)
                if not c then return end

                if vim.bo.filetype == "lua" then
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
                        end,
                    })
                end
            end,
        })
    end,
}
