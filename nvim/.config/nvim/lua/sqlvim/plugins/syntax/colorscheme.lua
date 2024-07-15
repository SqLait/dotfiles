return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        no_italic = true,
        transparent_background = false,
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },
}
