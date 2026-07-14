return {
    "mason-org/mason.nvim",
    event = { "BufReadPre", "VeryLazy" },
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
    end
}
