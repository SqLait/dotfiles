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
        color_overrides = {
          mocha = {
            red = "#ff657a",
            maroon = "#F29BA7",
            peach = "#ff9b5e",
            yellow = "#eccc81",
            green = "#a8be81",
            teal = "#9cd1bb",
            sky = "#A6C9E5",
            sapphire = "#86AACC",
            blue = "#5d81ab",
            lavender = "#66729C",
            mauve = "#b18eab",
            text = "#fcfcfa",
            surface2 = "#535763",
            surface1 = "#3a3d4b",
            surface0 = "#30303b",
            base = "#202027",
            mantle = "#1c1d22",
            crust = "#171719",
          },
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },
}
