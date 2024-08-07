return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    event = 'VimEnter',
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        no_italic = true,
        transparent_background = false,
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
            lavender = "#66729c",
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
      vim.cmd.colorscheme "catppuccin"
    end
  },
}

-- old: base = "#202027",
--old: mantle = #1c1d22
