if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r $HOME/configs/vim/config/templates/skeleton.sh
    autocmd BufNewFile *.py 0r $HOME/configs/vim/config/templates/skeleton.py
    autocmd BufNewFile docker-compose.yaml 0r $HOME/configs/vim/config/templates/docker-compose.yaml
    autocmd BufNewFile docker-compose.yml 0r $HOME/configs/vim/config/templates/docker-compose.yaml
  augroup END
endif
