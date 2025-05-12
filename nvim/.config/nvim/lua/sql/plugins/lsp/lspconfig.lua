return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
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
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local lspconfig = require("lspconfig")
        local map = vim.keymap

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls", "clangd", "csharp_ls", "rust_analyzer", "elixirls", "pyright",
            },
            automatic_enable = false,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "Show LSP references"
                map.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "Go to declaration"
                map.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Show LSP definitions"
                map.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "Show LSP implementations"
                map.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "See available code actions"
                map.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Show buffer diagnostics"
                map.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Show line diagnostics"
                map.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Show documentation for what is under cursor"
                map.set("n", "Q", vim.lsp.buf.hover, opts)

                opts.desc = "Restart LSP"
                map.set("n", "<leader>rs", ":LspRestart<CR>", opts)

                opts.desc = "Show LSP type definitions"
                map.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

                map.set("n", "gs", vim.lsp.buf.signature_help, opts)
                map.set("i", ",s", vim.lsp.buf.signature_help, opts)
            end,
        })

        -- Individual LSP server setups
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
        })

        lspconfig["clangd"].setup({
            capabilities = capabilities,
            cmd = { "clangd", "--compile-commands-dir=build" },
            filetype = { "c", "cpp" },
        })

        lspconfig["csharp_ls"].setup({
            capabilities = capabilities,
        })

        lspconfig["pyright"].setup({
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "strict",
                        autoSearchPaths = true,
                        diagnosticMode = "openFilesOnly",
                        useLibraryCodeForTypes = true,
                    },
                },
            },
        })

        lspconfig["rust_analyzer"].setup({
            capabilities = capabilities,
        })

        lspconfig["elixirls"].setup({
            cmd = { "elixir-ls" },
            capabilities = capabilities,
        })
    end,
}

