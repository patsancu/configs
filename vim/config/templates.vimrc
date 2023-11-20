if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r $HOME/configs/vim/config/templates/skeleton.sh
    autocmd BufNewFile *.py 0r $HOME/configs/vim/config/templates/skeleton.py
    " For some reason, vim seems to take the last matching one,
    " so narrower matching should go last
    autocmd BufNewFile *Test.py 0r $HOME/configs/vim/config/templates/test_skeleton.py
    autocmd BufNewFile *Tests.py 0r $HOME/configs/vim/config/templates/test_skeleton.py
    autocmd BufNewFile *test.py 0r $HOME/configs/vim/config/templates/test_skeleton.py
    autocmd BufNewFile *tests.py 0r $HOME/configs/vim/config/templates/test_skeleton.py
    autocmd BufNewFile docker-compose.yaml 0r $HOME/configs/vim/config/templates/docker-compose.yaml
    autocmd BufNewFile docker-compose.yml 0r $HOME/configs/vim/config/templates/docker-compose.yaml
    autocmd BufNewFile Dockerfile* 0r $HOME/configs/vim/config/templates/Dockerfile
    autocmd BufNewFile Justfile* 0r $HOME/configs/vim/config/templates/Justfile
    autocmd BufNewFile justfile* 0r $HOME/configs/vim/config/templates/Justfile
    autocmd BufNewFile *html 0r $HOME/configs/vim/config/templates/skeleton.html
  augroup END
endif
