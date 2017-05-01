" Keep backup stuff organized
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

set encoding=utf-8
set tabstop=4
set number
set cursorline

set expandtab
set tabstop=4
set shiftwidth=4

"Folding
set foldenable
set foldlevel=0
set foldnestmax=1
set foldmethod=indent
set foldtext=FoldText()

function FoldText()
    return '...'
endfunction
"Only very nested blocks are folded
set foldlevelstart=10

" Show trailing whitespaces as errors
match ErrorMsg '\s\+$'

" just to avoid the freaking prompt at launch-time
set cmdheight=3
" Copy paste to system clipboard
set clipboard=unnamedplus

"Cursor briefly jumps to the matching brace when
"you insert one
set showmatch
set matchtime=3

"Shows end of lines and stuff
":set nolist to disable
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set ignorecase
set smartcase
set backspace=indent,eol,start

"set shellcmdflag=-ci
"set shell=/bin/bash\ -li
"if &diff == 'nodiff'
"    set shellcmdflag=-ci
"endif
"set shell=bash\ --login
"color solarized
" ================PLUGINS================
"Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
"https://github.com/junegunn/vim-plugg
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'Valloric/YouCompleteMe'
Plug 'edkolev/promptline.vim'
"Plug 'lambdalisue/vim-gista'
"Plug 'mattn/emmet-vim' " HTML generation
Plug 'Valloric/YouCompleteMe'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
"Plug 'https://github.com/ctrlpvim/ctrlp.vim'
"Oscar
"https://gist.github.com/patsancu/4d9e63539a4f335e168695e285a92f97
Plug 'jiangmiao/auto-pairs'
"Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim' " needed for gist-vim
"Plug 'mhinz/vim-signify'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fireplace'
" Generate a nice airline tmux line theme
" nice ones are generated via:
" Tmuxline airline_insert Tmuxline airline_visual
" Don't forget to remove the utf line
" in the theme
"  In vim, inside a tmux session
" :Tmuxline whatever
" :TmuxlineSnapshot themfilename
Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-exchange'
" Initialize plugin system
call plug#end()
" ================PLUGINS END===============
"
colorscheme seoul256
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
" -----------------------
" Plugin configuration
" ------------------------



" Airline
" -------
" In order for airline to show always the statusline,
" and not only only splits
set laststatus=2

let promptline#slices#battery = ({ 'threshold': 95 })
" sections (a, b, c, x, y, z, warn) are optional
let g:promptline_preset = {
        \'a' : [ promptline#slices#host() ],
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd() ],
        \'x' : [ promptline#slices#python_virtualenv()],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'z' : [ promptline#slices#git_status(), '%*' ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

" Airline
" ========
let g:airline#extensions#tabline#enabled = 1

" NERDTree
" ========
let g:NERDTreeBookmarksFile = $HOME ."/.vim/plugged/nerdtree/bookmarks" " existing path to bookmarg
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" YouCompleteMe
" ========
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Emmejt
" ========
" Enable Emmet just for html/css
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall

" Closetag
" ========
" Enable Emmet just for html/css
"vim-closetag only for suitable files
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"


" Gist-vim
" ========
" Gists will be private by default
let g:gist_post_private = 1
" Show my private gists when listing
let g:gist_show_privates = 1
let g:gist_detect_filetype = 1


" Vim-javacomplete
" ========
autocmd FileType java setlocal omnifunc=javacomplete#Complete

let NERDTreeQuitOnOpen = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Fugitive
" ========
set statusline+=%{fugitive#statusline()}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" -----------------
" Undo configuration
" ------------------
"
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

" Python formatting
" ------------------
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

"--------
"Mappings
"--------
let mapleader=","

"
"copy paste
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
" Change buffers
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <A-j> :m .+1<CR>==
" Highlight words when searching by
" hitting enter
noremap <CR> :set hlsearch! hlsearch?<CR>

" Remove trailing whitespaces
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

nnoremap <Leader>n :NERDTreeToggle<CR>
"Fold toggle
nnoremap <Leader>f zA<CR>

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

" Map caps to escape
au VimEnter :silent * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"Unmap caps to escape
au VimLeave :silent * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Highlight in red with white font
hi Search ctermbg=DarkRed ctermfg=White
