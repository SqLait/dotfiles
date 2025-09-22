return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local lspconfig = vim.lsp.config('*', {
            capabilities = capabilities,
        })
        local map = vim.keymap

        vim.diagnostic.config({
            virtual_text = true,
            signs = false,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        require("mason-lspconfig").setup({
            function(name)
                vim.lsp.enable(name)
            end,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "Show LSP references"
                map.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts)

                opts.desc = "Go to declaration"
                map.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Show LSP definitions"
                map.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts)

                opts.desc = "Show LSP implementations"
                map.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)

                opts.desc = "Show LSP type definitions"
                map.set("n", "<leader>td", "<cmd>FzfLua lsp_typedef<CR>", opts)

                opts.desc = "See available code actions"
                -- map.set({ "n", "v" }, "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", opts)
                map.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Show line diagnostics"
                map.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Show documentation for what is under cursor"
                map.set("n", "Q", vim.lsp.buf.hover, opts)

                opts.desc = "Show LSP type definitions"
                map.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

                map.set("n", "gs", vim.lsp.buf.signature_help, opts)

                opts.desc = "Restart LSP"
                map.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
            end,
        })

        -- Individual LSP server setups
        vim.lsp.config.lua_ls = {
            capabilities = capabilities,
        }

        vim.lsp.config.clangd = {
            capabilities = capabilities,
            cmd = { "clangd", "--compile-commands-dir=build" },
            filetype = { "c", "cpp" },
        }

        vim.lsp.config.csharp_ls = {
            capabilities = capabilities,
        }

        vim.lsp.config.pyright = {
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
        }

        vim.lsp.config.rust_analyzer = {
            capabilities = capabilities,
        }

        vim.lsp.config.denols = {
            capabilities = capabilities,
        }

        vim.lsp.config.elixirls = {
            cmd = { "elixir-ls" },
            capabilities = capabilities,
        }
    end,
}

