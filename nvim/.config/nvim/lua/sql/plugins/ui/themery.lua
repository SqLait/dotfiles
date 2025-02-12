return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
        -- Minimal config
        require("themery").setup({
            -- themes = {"gruvbox", "catppuccin"},
            themes = {{
                name = "Gruvbox dark",
                colorscheme = "gruvbox",
                before = [[vim.opt.background = "dark"]],
            },
            {
                name = "Gruvbox light",
                colorscheme = "gruvbox",
                before = [[vim.opt.background = "light"]],
            },

                "catppuccin"
            },
            livePreview = true,
        })
    end
}
