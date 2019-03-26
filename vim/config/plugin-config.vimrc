" NERDTree
" ========
let g:NERDTreeBookmarksFile = $HOME ."/.vim/plugged/nerdtree/bookmarks" " existing path to bookmarg
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeQuitOnOpen = 1
let g:NERDTreeMapJumpNextSibling = '<Nop>'
let g:NERDTreeMapJumpPrevSibling = '<Nop>'

" Airline
" ========
" In order for airline to show always the statusline,
" and not only only splits
set laststatus=2
" Rounded separators (extra-powerline-symbols):
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"
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
let g:airline#extensions#tabline#enabled = 1

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
let g:gist_get_multiplefile = 1
let g:gist_open_browser_after_post = 1


" Vim-javacomplete
" ========
autocmd FileType java setlocal omnifunc=javacomplete#Complete


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

" Slime config
" ========
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

" Tmux navigator
" ========
let g:tmux_navigator_no_mappings = 1

" Emmejt
" ========
" Enable Emmet just for html/css
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall


" Youcompleteme
" =============
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Ultisnips
" =========
let g:UltiSnipsSnippetDirectories=[$HOME . "/configs/vim/config/ultisnips", $HOME . "/.vim/plugged/vim-snippets/UltiSnips"]
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
