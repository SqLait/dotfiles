vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap=true, silent=true }

keymap.set("n", "<leader>nh", ":nohl<Cr>", {desc = "Clear search highlights"})

-- Paste without losing text
keymap.set("v", "p", '"_dP"')

-- increment/decrement int values
keymap.set("n", "<leader>+", "<C-a>", {desc = "increment number"})
keymap.set("n", "<leader>-", "<C-x>", {desc = "decrement number"})

-- move selected text in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Add whitespace to selected text in visual mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Enter visual block mode
--keymap.set('n', '/v', '<C-v>', { desc = "Enter visual block mode" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", {desc = "split window vertically"})
keymap.set("n", "<leader>sh", "<C-w>s", {desc = "split window horizontally"})
keymap.set("n", "<leader>se", "<C-w>=", {desc = "make split equal size"})
keymap.set("n", "<leader>sx", "<cmd>close<CR>", {desc = "close current split"})

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {desc = "open new tab"})
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {desc = "close current tab"})
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", {desc = "go to next tab"})
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", {desc = "go to previous tab"})
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", {desc = "open current buffer in new tab"})

-- Resize split windows
keymap.set("n", "<C-Up>", ":resize -2<CR>")
keymap.set("n", "<C-Down>", ":resize +2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Resize split terminal windows
keymap.set("t", "<C-Up>", "<cmd>resize -2<CR>")
keymap.set("t", "<C-Down>", "<cmd>resize +2<CR>")
keymap.set("t", "<C-Left>", "<cmd>vertical resize -2<CR>")
keymap.set("t", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- Escape terminal
keymap.set("t", "<Esc>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

--buffer navigation
keymap.set("n", "<leader>bd", "<Cmd>bd<CR>", {desc = "delete open buffer"})
-- keymap.set("n", "<S-tab>", "<cmd>bprev<cr>", {desc = "Prev Buffer"})
-- keymap.set("n", "<tab>", "<cmd>bnext<cr>", {desc = "Next Buffer"})
-- keymap.set("n", "<tab>f", "<cmd>bfirst<cr>", {desc = "Jump to first buffer in the list"})
-- keymap.set("n", "<tab>l", "<cmd>blast<cr>", {desc = "Jump to the last buffer in the list"})

--Toggle line numbers
keymap.set("n", "<leader>rl", ":set relativenumber!<CR>", { desc = "Toggle relative line numbers" })

--NvimTree
keymap.set("n", "<leader>ee", "<cmd>Oil --float<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
-- keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
-- keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
-- keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

--Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>st", "<cmd>PickThemery<cr>", { desc = "Switch themes" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Show buffers in telescope" })
keymap.set("n", "<leader>xx", function()
    require("telescope.builtin").diagnostics({ previewer = false })
end, { desc = "Show LSP diagnostic (global)" })
keymap.set("n", "<leader>xl", function()
    require("telescope.builtin").diagnostics({
        bufnr = 0,
        previewer = false
    })
end, { desc = "Show LSP diagnostic (local)" })keymap.set("n", "<leader>fgc", "<cmd>Telescope git_commits", { desc = "Show LSP diagnostic (global)" })
keymap.set("n", "<leader>fgs", "<cmd>Telescope git_status", { desc = "Show LSP diagnostic (global)" })
keymap.set("n", "<leader>fgb", "<cmd>Telescope git_branches", { desc = "Show LSP diagnostic (global)" })

--Tmux keybinds
keymap.set("n", "<c-k>", ":wincmd k<CR>")
keymap.set("n", "<c-j>", ":wincmd j<CR>")
keymap.set("n", "<c-h>", ":wincmd h<CR>")
keymap.set("n", "<c-l>", ":wincmd l<CR>")

keymap.set("n", "C-k", ":wincmd k<CR>")
keymap.set("n", "C-j", ":wincmd j<CR>")
keymap.set("n", "C-h", ":wincmd h<CR>")
keymap.set("n", "C-l", ":wincmd l<CR>")

keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--Find and replace all appearences of that word
-- keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--chmod a bash file to be executable
keymap.set("n", "<leader>chx", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Undotree
keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Capital J remap
keymap.set("n", "J", "mzJ`z")

-- rename variables
keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-- Maximize splits
keymap.set('n', '<leader>sm', '<cmd>MaximizerToggle<Cr>')

-- some modifier based binds I like
keymap.set('i', '<C-H>', '<C-W>', { silent = true, noremap = true })
keymap.set({'n', 'v', 'i'}, '<C-C>', '<Esc>')
