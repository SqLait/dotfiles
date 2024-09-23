return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

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

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "lua_ls", "clangd", "csharp_ls", "tsserver",
        "pylsp", "rust_analyzer", "zls", "elixirls",
        "html", "cssls"
      },
    })
  end,
}
