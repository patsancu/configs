"--------
"Mappings
"--------
let mapleader=","

"Tmux navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>

"copy paste
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
" Change buffers
nnoremap <Leader>k :bprev<CR>
nnoremap <Leader>l :bnext<CR>
nnoremap <A-j> :m .+1<CR>==
" Highlight words when searching by
" hitting enter
noremap <CR> :set hlsearch! hlsearch?<CR>

" Remove trailing whitespaces
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

nnoremap <Leader>n :NERDTreeToggle<CR>
"Fold toggle
nnoremap <Leader>f zA<CR>

map <Leader>U gUU
map <Leader>u guu



"Gist private and public
nnoremap <Leader>g :Gist -p<CR>
nnoremap <Leader>G :Gist -P<CR>

"Javacomplete2
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

" Print current file's full path
noremap <leader>, :echo expand('%:p')<CR>
noremap <leader>. :set list!<CR>

" Enter space in normal mode with ss
nnoremap ss i<space><esc>

" Enter new line in normal mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Quit buffer with ,q
nnoremap <Leader>q :bd<Enter>

nnoremap <Leader>p :TagbarToggle<CR>
nnoremap <Leader>ev :Eval<CR>

"Slime
xmap <Leader>m <Plug>SlimeRegionSend
nmap <Leader>m <Plug>SlimeParagraphSend
let g:slime_python_ipython = 1

