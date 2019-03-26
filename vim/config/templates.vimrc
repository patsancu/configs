if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r $HOME/configs/vim/config/templates/skeleton.sh
    autocmd BufNewFile *.py 0r $HOME/configs/vim/config/templates/skeleton.py
  augroup END
endif
