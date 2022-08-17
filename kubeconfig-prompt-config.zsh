ANTIGEN_FILE=~/antigen.zsh
if [ -f "$ANTIGEN_FILE" ]; then
    source "$ANTIGEN_FILE"
    SPACESHIP_CHAR_SYMBOL="⬥  "

    SPACESHIP_FOOBAR_COLOR=green
    spaceship_foobar () {
        local 'foobar_status'
        foobar_status=$( echo -n $KUBECONFIG | grep -Eo "(dev|prod)" )
        if [[ $foobar_status ==  "prod" ]]; then
            SPACESHIP_FOOBAR_COLOR=red
            foobar_status="⚠️  You are on the $foobar_status cluster ⚠️"
        else
            foobar_status="You are on the $foobar_status cluster "
        fi
        [[ -z $foobar_status ]] && return
        spaceship::section \
            "$SPACESHIP_FOOBAR_COLOR" \
            "$SPACESHIP_FOOBAR_PREFIX" \
            "$SPACESHIP_FOOBAR_SYMBOL$foobar_status" \
            "$SPACESHIP_FOOBAR_SUFFIX"
        }
        SPACESHIP_PROMPT_ORDER=(foobar line_sep $SPACESHIP_PROMPT_ORDER)
fi
