" ================PLUGINS================
"Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)

" Automagically install vim plug and install the plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Asheq/close-buffers.vim'
" Plug 'SirVer/ultisnips'
" Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'honza/vim-snippets'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jiangmiao/auto-pairs'
Plug 'jpalardy/vim-slime'
Plug 'ludovicchabant/vim-lawrencium' "Mercurial
Plug 'majutsushi/tagbar'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim' " needed for gist-vim
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'udalov/kotlin-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'frazrepo/vim-rainbow'
Plug 'sheerun/vim-polyglot'
Plug 'NoahTheDuke/vim-just'
Plug 'godlygeek/tabular'

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

