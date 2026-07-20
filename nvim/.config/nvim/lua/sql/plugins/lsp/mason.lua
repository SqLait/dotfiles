return {
    "mason-org/mason.nvim",
    event = { "BufReadPre" },
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
    end
}
