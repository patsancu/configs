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
Plug 'scrooloose/nerdcommenter'
"Plug 'lambdalisue/vim-gista'

"Oscar
"https://gist.github.com/patsancu/4d9e63539a4f335e168695e285a92f97
"Plug 'junegunn/gv.vim'
Plug 'mattn/gist-vim'
"Plug 'mhinz/vim-signify'
"Plug 'tpope/vim-fugitive'
Plug 'mattn/webapi-vim' " needed for gist-vim


" Initialize plugin system
call plug#end()
" ================PLUGINS END================
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    silent call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

color Monokai
"set background=dark
"color solarized
set tabstop=4
set number

"Shows end of lines and stuff
":set unlist to disable
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list

" Show buffer 'tabs'
let g:airline#extensions#tabline#enabled = 1

let g:NERDTreeBookmarksFile = $HOME ."/.vim/plugged/nerdtree/bookmarks" " existing path to bookmarg
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Gista
"let g:gista#client#default_username = 'patsancu'
"

" Gist-vim
" Gists will be private by default
let g:gist_post_private = 1

"--------
"Mappings
"--------
"copy paste
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
" Change buffers
nnoremap <C-left> :bprev<CR>
nnoremap <C-right> :bnext<CR>

"Autocomplete with CTRL+space
inoremap <Nul> <C-n>

" Map caps to escape
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"Unmap caps to escape
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
