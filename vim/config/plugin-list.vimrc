" ================PLUGINS================
"Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'artur-shaik/vim-javacomplete2'
"Plug 'Valloric/YouCompleteMe'
Plug 'edkolev/promptline.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim' " needed for gist-vim
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fireplace'
Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tommcdo/vim-exchange'
Plug 'christoomey/vim-tmux-navigator'
Plug 'majutsushi/tagbar'
Plug 'jpalardy/vim-slime'
Plug 'ludovicchabant/vim-lawrencium' "Mercurial
Plug 'chrisbra/csv.vim'
"Plug 'SirVer/ultisnips'
Plug 'udalov/kotlin-vim'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Generate a nice airline tmux line theme
" nice ones are generated via:
" Tmuxline airline_insert Tmuxline airline_visual
" Don't forget to remove the utf line
" in the theme
"  In vim, inside a tmux session
" :Tmuxline whatever
" :TmuxlineSnapshot themfilename


"Plug 'junegunn/gv.vim'
"Plug 'lambdalisue/vim-gista'
"Plug 'mattn/emmet-vim' " HTML generation
"Plug 'https://github.com/ctrlpvim/ctrlp.vim'
"Plug 'mhinz/vim-signify'
"Oscar
"https://gist.github.com/patsancu/4d9e63539a4f335e168695e285a92f97
call plug#end()
" ================PLUGINS END===============

