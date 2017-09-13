set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

" Keep backup stuff organized
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

set encoding=utf-8
set tabstop=4
" Relative number by default
set relativenumber
set number "this, added to relative number, makes hybrid mode
set cursorline

" Incremental search
set incsearch

set expandtab
set tabstop=4
set shiftwidth=4

set cryptmethod=blowfish2

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

" Abbreviations
iabbr #p #!/usr/bin/env python
iabbr #b #!/bin/bash


colorscheme seoul256

" faster macros, without showing every single step
set lazyredraw

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
