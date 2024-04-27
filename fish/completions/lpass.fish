function __lpass_complete_name
    lpass ls | sed -e "s/ \[id.*//g" -e "s/(none)\///g" 2> /dev/null
end

function __lpass_complete_group
    lpass ls | awk -F '/' '{print $1}' 2> /dev/null
end

function _lpass_base
    argparse --min-args=1 'd/desc=' -- $argv
    or return

    set -l __commands login logout passwd mv add edit duplicate rm status \
        sync import export share generate ls show

    set -l args -c lpass \
        -n "not __fish_seen_subcommand_from $__commands" \
        -a "$argv[1]" \
        $argv[2..-1]

    if set -ql _flag_desc
        set -a args -d $_flag_desc
    end

    complete $args
end

complete -c lpass -f

# complete name
complete -c lpass \
    -n "__fish_seen_subcommand_from show rm edit duplicate generate mv" \
    -a "(__lpass_complete_name)"
# complete group
complete -c lpass \
    -n "__fish_seen_subcommand_from ls" \
    -a "(__lpass_complete_group)"
# sync
complete -c lpass \
    -n "__fish_seen_subcommand_from show ls  mv add edit rm edit duplicate generate sync import export" \
    -l "sync" -ra "auto now no" -f

_lpass_base "login logout share mv add edit duplicate rm status sync"
_lpass_base passwd -d "change your LastPass password"
_lpass_base import -d "loads account info from an unencrypted CSV file"
_lpass_base export -d "dumps unencrypted account info to stdout"
_lpass_base generate -d "create a randomly generated password"
_lpass_base ls -d "list names in groups in a tree structure"

_lpass_base show -d "display a password or selected field "
complete -c lpass \
    -n "__fish_seen_subcommand_from show" \
    -l "expand-multi" -s "x" -l "json" -s "j" -l "password" -s "p"
