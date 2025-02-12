vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
local o = vim.o
local g = vim.g
local loader = vim.loader

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

-- Incremental search
opt.hlsearch = false
opt.incsearch = true

-- Scrolling
opt.scrolloff = 8

--Set language to english
o.spelllang = 'en_us'

--Tab shizzle:
o.title = true
o.titlestring = "%t"

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_matchparen = 1

--Optimization:
o.lazyredraw = true
o.updatetime = 50
o.swapfile = false
o.hidden = true
o.termguicolors = true
o.undofile = true

loader.enable()
