set tabstop=4

" just to avoid the freaking prompt at launch-time
set cmdheight=3
" Copy paste to system clipboard
set clipboard=unnamedplus





" ================PLUGINS================
"Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
"https://github.com/junegunn/vim-plugg
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()
" ================PLUGINS END================
"color ron
colorscheme Monokai
set tabstop=4
set number
" Show buffer 'tabs'
let g:airline#extensions#tabline#enabled = 1

let g:NERDTreeBookmarksFile = $HOME ."/.vim/plugged/nerdtree/bookmarks" " existing path to bookmarg
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"Mappings
"copy paste
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Map caps to escape
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"Unmap caps to escape
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
