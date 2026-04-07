return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",

    config = function()
        local ts = require("nvim-treesitter")

        -- Basic setup
        ts.setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        -- Ensure parsers are installed
        ts.install({
            "vim",
            "vimdoc",
            "html",
            "css",
            "typescript",
            "lua",
            "bash",
            "rust",
            "zig",
            "c",
            "cpp",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })

        -- Enable Treesitter-based indentation (experimental)
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
