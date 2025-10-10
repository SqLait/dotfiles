return {
    "williamboman/mason.nvim",
    event = { "BufReadPre", "VeryLazy" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_pending = " ",
                    package_installed = "󰄳 ",
                    package_uninstalled = " ",
                },
            },
        })
    end,
}
