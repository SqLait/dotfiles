-- vim.cmd("colorscheme gruvbox")
return {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_enable_italic = false
        vim.g.gruvbox_material_disable_italic_comment = true
        vim.g.gruvbox_material_background = 'soft'
        vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
        vim.g.gruvbox_material_better_performance = 1
        vim.cmd.colorscheme('gruvbox-material')

        local config = vim.fn['gruvbox_material#get_configuration']()
        local palette = vim.fn['gruvbox_material#get_palette'](config.background, config.foreground, config.colors_override)
        local set_hl = vim.fn['gruvbox_material#highlight']

        set_hl('LineNr', palette.grey2, palette.none)
        set_hl('CursorLineNr', palette.yellow, palette.none)

        -- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg=palette.green, bold=true })
        -- vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
        -- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg=green, bold=true })
      end
    --[[{
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        event = 'VeryLazy',
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                no_italic = true,
                color_overrides = {
                    mocha = {
                        red = "#ff657a",
                        maroon = "#f29ba7",
                        peach = "#ff9b5e",
                        yellow = "#eccc81",
                        green = "#a8be81",
                        teal = "#9cd1bb",
                        sky = "#a6c9e5",
                        sapphire = "#86aacc",
                        blue = "#5d81ab",
                        lavender = "#8594ca",
                        mauve = "#b18eab",
                        text = "#fcfcfa",
                        subtext1 = "#fcfcfa",
                        subtext0 = "#fcfcfa",
                        surface2 = "#535763",
                        surface1 = "#3a3d4b",
                        surface0 = "#30303b",
                        base = "#1d1d1d",
                        mantle = "#1b1b1b",
                        crust = "#171719",
                    },
                },
            })
        end
    },]]--
    --[[{
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            -- Set background before loading colorscheme
            vim.o.background = "dark" -- or "light" for light mode

            -- Custom configuration options
            require("gruvbox").setup({
                terminal_colors = true,
                undercurl = true,
                underline = true,
                bold = false,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = true,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = false,
                contrast = "soft", -- "hard", "soft", or ""
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })

        end,
    },]]
}
