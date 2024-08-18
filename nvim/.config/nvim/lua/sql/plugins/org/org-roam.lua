return {
  "chipsenkbeil/org-roam.nvim",

  event = 'VeryLazy',
  ft = { 'org' },

  tag = "0.1.0",
  dependencies = {
    {
      "nvim-orgmode/orgmode",
      tag = "0.3.4",
    },
  },
  config = function()
    require("org-roam").setup({
      directory = "~/Documents/OrgRoamFiles",
      -- optional
      org_files = {
        "~/Documents/orgfiles/**/*",
        "~/Documents/OrgRoamFiles/**/*"
      }
    })
  end
}
