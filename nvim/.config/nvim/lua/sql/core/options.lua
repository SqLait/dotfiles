vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- set cursor line
opt.cursorline = true

-- Turn of swap file
opt.swapfile = false

--Set line numbers
opt.relativenumber = true

--Shorten URLS
opt.conceallevel = 2
opt.concealcursor = 'nc'

--Set language to english
vim.o.spelllang = 'en_us'

--Tab shizzle:
vim.o.title = true
vim.o.titlestring = "%t"
