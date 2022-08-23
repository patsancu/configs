ANTIGEN_FILE=~/antigen.zsh
if [ -f "$ANTIGEN_FILE" ]; then
    source "$ANTIGEN_FILE"
    SPACESHIP_CHAR_SYMBOL="⬥  "

    SPACESHIP_CLUSTERCONFIG_COLOR=green
    spaceship_clusterconfig () {
        local 'clusterconfig_status'
        clusterconfig_status=$( echo -n $KUBECONFIG | grep -Eo "(dev|prod)" )
        if [[ $clusterconfig_status ==  "prod" ]]; then
            SPACESHIP_CLUSTERCONFIG_COLOR=red
            clusterconfig_status="⚠️  You are on the $clusterconfig_status cluster ⚠️"
        else
            clusterconfig_status="You are on the $clusterconfig_status cluster "
        fi
        [[ -z $clusterconfig_status ]] && return
        spaceship::section \
            "$SPACESHIP_CLUSTERCONFIG_COLOR" \
            "$SPACESHIP_CLUSTERCONFIG_PREFIX" \
            "$SPACESHIP_CLUSTERCONFIG_SYMBOL$clusterconfig_status" \
            "$SPACESHIP_CLUSTERCONFIG_SUFFIX"
        }
        SPACESHIP_PROMPT_ORDER=(clusterconfig line_sep $SPACESHIP_PROMPT_ORDER)
fi
