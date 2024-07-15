return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    --"hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
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
          -- custom colors
          winhighlight = "Normal:Normal,BorderBG:BorderBG", -- BorderBG|FloatBorder
          side_padding = 0, -- padding at sides
          col_offset = -3, -- move floating box left or right
        },
        documentation = {
          border = "none", -- single|rounded|none
          -- custom colors
          --winhighlight = "Normal:Normal,BorderBG:BorderBG,CursorLine:CursorLineBG,Search:None", -- BorderBG|FloatBorder
          winhighlight = "Normal:Normal,BorderBG:BorderBG", -- BorderBG|FloatBorder
          side_padding = 0, -- padding at sides
          col_offset = -3, -- move floating box left or right

        },
      },
      --[[snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },]]
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          -- vscode like icons for cmp autocompletion
          local fmt = lspkind.cmp_format({
            -- with_text = false, -- hide kind beside the icon
            mode = "symbol_text",
            maxwidth = 10,
            ellipsis_char = "...",
          })(entry, item)

          local strings = vim.split(fmt.kind, "%s", { trimempty = true })

          fmt.kind = fmt.kind .. " " -- just an extra space at the end
          fmt.menu = strings[2] ~= nil and ("  " .. (strings[2] or "")) or ""

          return fmt
        end,
      },
    })
    -- Add the final if statement here
  end,
}
