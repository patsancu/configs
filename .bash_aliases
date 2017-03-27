alias instalar='sudo apt-get install -y'
alias buscarPaquete='sudo apt-cache search'

alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -la'
alias l='ls -CF'
alias kk='ll'

alias actualizar='sudo apt-get update; sudo apt-get upgrade; sudo apt-get autoremove; sudo apt-get autoclean; sudo apt-get update'
alias matar='sudo killall'
#alias montar1and1='sshfs u76288608@sanzo.es:/ ~/ssh1and1/'
#alias desmontar1and1='fusermount -u ssh1and1'
#alias ftp1and1='sftp u76288608@sanzo.es'
#alias descargarVideo="youtube-dl --proxy '127.0.0.1:8123'"
alias descargarVideo='proxychains youtube-dl'
## this one saved by butt so many times ##
alias wget='wget -c'

alias disco='df -h'
#alias ip='curl ipinfo.io'
alias ip='ip=`curl -s http://whatismyip.akamai.com/`; echo $ip'


alias h='history'
alias j='jobs -l'


alias ports='netstat -tulanp'

alias procesos='ps -aux'
alias red='netstat -nap'


###Computer usage
## pass options to free ## 
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'


alias buscarPaquete='sudo apt-cache search --names-only'
alias buscarPaquetePorDescripcion='sudo apt-cache search'




alias getBTCeurPrice='btcPrice=`curl -s  http://api.coindesk.com/v1/bpi/currentprice.json | jq "[.bpi.EUR.rate_float]" | grep -v "\[" | grep -v "\]" | tr -d " "`; btcPriceUnit="$btcPrice"."EUR"; echo "1BTC=$btcPriceUnit"'

alias getETHeurPrice='ethPrice=`curl -s  https://coinmarketcap-nexuist.rhcloud.com/api/eth | jq "[.price.eur]" | grep -v "\[" | grep -v "\]" | tr -d " "`; ethPriceUnit="$ethPrice"."EUR"; echo "1ETH=$ethPriceUnit"'
alias recargarAlias='source ~/.bashrc'

#alias roo="/home/patrick/Development/Software/spring-roo-2.0.0.M2/bin/roo.sh"

alias checkInternet='ping 8.8.8.8'
alias lsd='ls -d */'
alias lld='ls -ld */'
alias gitweb=my_gitweb
