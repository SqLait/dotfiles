" Set the mapleader key to space
let mapleader = " "

" Function to set key mappings with descriptions
function! SetKeymap(mode, lhs, rhs, desc)
  execute a:mode . "noremap <silent> " . a:lhs . " " . a:rhs
  if !empty(a:desc)
    execute "command! -nargs=0 " . substitute(a:desc, ' ', '', 'g') . " echo '" . a:desc . "'"
  endif
endfunction

" Clear search highlights
call SetKeymap('n', '<leader>nh', ':nohl<CR>', 'Clear search highlights')

" Paste without losing text
vnoremap p "_dP

" Increment/decrement int values
call SetKeymap('n', '<leader>+', '<C-a>', 'increment number')
call SetKeymap('n', '<leader>-', '<C-x>', 'decrement number')

" Move selected text in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Add whitespace to selected text in visual mode
vnoremap < <gv
vnoremap > >gv

" Enter visual block mode
" Uncomment the line below if you want to use this mapping
" nnoremap /v <C-v>

" Window management
call SetKeymap('n', '<leader>sv', '<C-w>v', 'split window vertically')
call SetKeymap('n', '<leader>sh', '<C-w>s', 'split window horizontally')
call SetKeymap('n', '<leader>se', '<C-w>=', 'make split equal size')
call SetKeymap('n', '<leader>sx', '<cmd>close<CR>', 'close current split')

call SetKeymap('n', '<leader>to', '<cmd>tabnew<CR>', 'open new tab')
call SetKeymap('n', '<leader>tx', '<cmd>tabclose<CR>', 'close current tab')
call SetKeymap('n', '<leader>tn', '<cmd>tabn<CR>', 'go to next tab')
call SetKeymap('n', '<leader>tp', '<cmd>tabp<CR>', 'go to previous tab')
call SetKeymap('n', '<leader>tf', '<cmd>tabnew %<CR>', 'open current buffer in new tab')

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

" Resize split terminal windows
tnoremap <C-Up> <cmd>resize -2<CR>
tnoremap <C-Down> <cmd>resize +2<CR>
tnoremap <C-Left> <cmd>vertical resize -2<CR>
tnoremap <C-Right> <cmd>vertical resize +2<CR>

" Escape terminal
tnoremap <Esc> <C-\><C-N>

" Buffer navigation
call SetKeymap('n', '<leader>bd', '<Cmd>bd<CR>', 'delete open buffer')
call SetKeymap('n', '<S-tab>', '<cmd>bprev<cr>', 'Prev Buffer')
call SetKeymap('n', '<tab>n', '<cmd>bnext<cr>', 'Next Buffer')
call SetKeymap('n', '<tab>f', '<cmd>bfirst<cr>', 'Jump to first buffer in the list')
call SetKeymap('n', '<tab>l', '<cmd>blast<cr>', 'Jump to the last buffer in the list')

" Toggle line numbers
call SetKeymap('n', '<leader>nl', ':set relativenumber!<CR>', 'Toggle relative line numbers')

