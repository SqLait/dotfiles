" Set the mapleader key to space
let mapleader = " "

" Function to set key mappings
function! SetKeymap(mode, lhs, rhs)
  execute a:mode . "noremap <silent> " . a:lhs . " " . a:rhs
endfunction

" Clear search highlights
call SetKeymap('n', '<leader>nh', ':nohl<CR>')

" Paste without losing text
vnoremap p "_dP

" Increment/decrement int values
call SetKeymap('n', '<leader>+', '<C-a>')
call SetKeymap('n', '<leader>-', '<C-x>')

" Move selected text in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Indent without losing selection
vnoremap < <gv
vnoremap > >gv

" Window management
call SetKeymap('n', '<leader>sv', '<C-w>v') " Split window vertically
call SetKeymap('n', '<leader>sh', '<C-w>s') " Split window horizontally
call SetKeymap('n', '<leader>se', '<C-w>=') " Make splits equal
call SetKeymap('n', '<leader>sx', '<cmd>close<CR>') " Close split

" Tab management
call SetKeymap('n', '<leader>to', '<cmd>tabnew<CR>') " Open new tab
call SetKeymap('n', '<leader>tx', '<cmd>tabclose<CR>') " Close tab
call SetKeymap('n', '<leader>tn', '<cmd>tabn<CR>') " Next tab
call SetKeymap('n', '<leader>tp', '<cmd>tabp<CR>') " Previous tab
call SetKeymap('n', '<leader>tf', '<cmd>tabnew %<CR>') " Current buffer in new tab

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize split windows
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Resize split terminal windows (only if using Neovim)
if has('nvim')
  tnoremap <C-Up> <cmd>resize -2<CR>
  tnoremap <C-Down> <cmd>resize +2<CR>
  tnoremap <C-Left> <cmd>vertical resize -2<CR>
  tnoremap <C-Right> <cmd>vertical resize +2<CR>
  tnoremap <Esc> <C-\><C-N> " Escape terminal mode
endif

" Buffer navigation
call SetKeymap('n', '<leader>bd', '<Cmd>bd<CR>') " Delete buffer
call SetKeymap('n', '<leader>bp', '<cmd>bprev<cr>') " Previous buffer
call SetKeymap('n', '<leader>bn', '<cmd>bnext<cr>') " Next buffer
call SetKeymap('n', '<leader>bf', '<cmd>bfirst<cr>') " First buffer
call SetKeymap('n', '<leader>bl', '<cmd>blast<cr>') " Last buffer

" Toggle relative line numbers
call SetKeymap('n', '<leader>nl', ':set relativenumber!<CR>')

" Set netrw list style (file explorer)
let g:netrw_liststyle = 3

" Tabs & indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Disable line wrap
set nowrap

" Search settings
set ignorecase
set smartcase

" Clipboard support (use system clipboard)
set clipboard+=unnamedplus

" Split window behavior
set splitright
set splitbelow

" Disable cursor line highlight
set nocursorline

" Turn off swap file
set noswapfile

" Set relative line numbers
set relativenumber

syntax on
