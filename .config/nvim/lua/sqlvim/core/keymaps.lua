vim.g.mapleader = " "

local keymap = vim.keymap

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

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to the upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to the right window' })

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
keymap.set("n", "<S-tab>", "<cmd>bprev<cr>", {desc = "Prev Buffer"})
keymap.set("n", "<tab>n", "<cmd>bnext<cr>", {desc = "Next Buffer"})
keymap.set("n", "<tab>f", "<cmd>bfirst<cr>", {desc = "Jump to first buffer in the list"})
keymap.set("n", "<tab>l", "<cmd>blast<cr>", {desc = "Jump to the last buffer in the list"})

--Toggle line numbers
keymap.set("n", "<leader>nl", ":set relativenumber!<CR>", { desc = "Toggle relative line numbers" })
