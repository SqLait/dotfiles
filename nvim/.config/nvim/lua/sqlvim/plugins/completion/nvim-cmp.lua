return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone",
      },

      window = {
        completion = {
          border = "none", -- single|rounded|none
          winhighlight = "Normal:Normal,BorderBG:BorderBG",
          side_padding = 0,
          col_offset = -3,
        },
        documentation = {
          border = "none", -- single|rounded|none
          winhighlight = "Normal:Normal,BorderBG:BorderBG",
          side_padding = 0,
          col_offset = -3,
        },
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          local kind = item.kind
          local kind_text = kind:lower()
          local icon_hl_group = "CmpItemKind" .. kind

          if vim.fn.hlID(icon_hl_group) == 0 then
            icon_hl_group = "CmpItemKind" -- fallback to default if specific kind group is missing
          end

          item.kind = " " .. lspkind.symbolic(kind, { mode = "symbol" }) .. "  " -- add spaces around the icon for better appearance
          item.menu = " [" .. kind_text .. "]"

          -- apply the highlighting only to the icon part
          item.kind_hl_group = icon_hl_group
          return item
        end,
      },
      experimental = {
        ghost_text = true,
      },
    })
    -- Custom highlights for all item kinds
    local colors = require("catppuccin.palettes").get_palette("mocha") -- adjust to your color scheme
    local kind_bg = {
      Text = colors.teal,
      Method = colors.blue,
      Function = colors.blue,
      Constructor = colors.blue,
      Field = colors.green,
      Variable = colors.flamingo,
      Class = colors.yellow,
      Interface = colors.yellow,
      Module = colors.blue,
      Property = colors.green,
      Unit = colors.green,
      Value = colors.peach,
      Enum = colors.green,
      Keyword = colors.red,
      Snippet = colors.mauve,
      Color = colors.red,
      File = colors.blue,
      Reference = colors.red,
      Folder = colors.blue,
      EnumMember = colors.red,
      Constant = colors.peach,
      Struct = colors.blue,
      Event = colors.blue,
      Operator = colors.blue,
      TypeParameter = colors.blue,
      Copilot = colors.teal,
    }

    for kind, bg in pairs(kind_bg) do
      local hl_group = "CmpItemKind" .. kind
      vim.api.nvim_set_hl(0, hl_group, { fg = colors.base, bg = bg })
    end
  end,
}


