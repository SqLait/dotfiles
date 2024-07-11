return
{
    --[['akinsho/toggleterm.nvim']},
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "float",
        shell = vim.o.shell, --setting the standard vim shell. 

        start_in_insert = true,

        highlights = {
          NormalFloat = {
            link = "Normal"
          },
          FloatBorder = {
            guifg = "#89b4fa",
          }
        },
        float_opts = {
          border = 'rounded',
        }
      })

      --local Terminal  = require('toggleterm.terminal').Terminal
      local keymap = vim.keymap
      In = vim.fn

      function Open_terminal(mode, index)
        vim.cmd(index .."ToggleTerm direction=".. mode)
      end

      --Toggle the terminal in the set direction
      keymap.set('n', '<leader>tt', '<cmd>:ToggleTerm<CR>')
      -- Horizontal mode
      keymap.set('n', '<leader>th', '<cmd>lua Open_terminal("horizontal", In.input("Enter terminal index: "))<cr>')
      -- Vertical mode
      keymap.set ('n', '<leader>tv', '<cmd>lua Open_terminal("vertical", In.input("Enter terminal index: "))<cr>')
      -- Float mode
      keymap.set ('n', '<leader>tf', '<cmd>lua Open_terminal("float", In.input("Enter terminal index: "))<cr>')
      keymap.set ('n', '<leader>ta', '<cmd>lua Open_terminal("tab", In.input("Enter terminal index: "))<cr>')
      -- Open a toggled terminal
      keymap.set('n', '<leader>ts', '<cmd>TermSelect<cr>')
    end,]]
}
