set tabstop=4

" Map caps to escape
" <silent> hides the Prompt showing just before the editor shows
au VimEnter <silent> * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"Unmap caps to escape
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'



" ================PLUGINS================
"Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
"https://github.com/junegunn/vim-plugg
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'

" Initialize plugin system
call plug#end()
" ================PLUGINS END================
"color ron
colorscheme Monokai
set tabstop=4
set number
