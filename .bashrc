# Timestamp for history
HISTTIMEFORMAT="%F %T "

# Activate bash completion for options
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# UP-n function to avoid cds like ./../../../../..
function up {
[ "${1/[^0-9]/}" == "$1" ] && {
        local ups=""
        for i in $(seq 1 $1)
        do
                ups=$ups"../"
        done
        cd $ups
        } || echo "usage: up INTEGER"
}
