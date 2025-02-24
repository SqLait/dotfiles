return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = {
            ['<C-k>'] = { 'select_prev' },
            ['<C-j>'] = { 'select_next' },
            ['<CR>'] = { 'accept', 'fallback' },
        },

        cmdline = {
            keymap = {
                ['<CR>'] = { }
            }
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },
        completion = {
            menu = {
                border = vim.g.border_style,
                scrolloff = 1,
                scrollbar = false,
                draw = {
                    columns = {
                        { "kind_icon", "label", gap = 1 },
                        { "kind" }
                    }
                }
            },
            documentation = {
                auto_show = false,
                auto_show_delay_ms = 50,
                window = {
                    border = vim.g.border_style
                }
            },
            ghost_text = {
                enabled = false
            }
        },
        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                lsp = {
                    name = "LSP",
                    module = "blink.cmp.sources.lsp"
                },
            },
        },
    },
    opts_extend = { "sources.default" }
}
