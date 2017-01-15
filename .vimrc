set tabstop=4

" Map caps to escape
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"Unmap caps to escape
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'



" ================PLUGINS================
"Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" Initialize plugin system
call plug#end()
" ================PLUGINS END================
