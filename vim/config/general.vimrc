set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

" Keep backup stuff organized
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

set encoding=utf-8
set tabstop=4
set number
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
