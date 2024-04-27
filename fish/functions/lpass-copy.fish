function lpass-copy
    set -l pswd (lpass show $argv[1] -p)
    or return 1

    if string match -e "Multiple matches" $pswd
        echo "Multiple matches found"
        lpass show $argv[1] -x
        return 1
    end

    wl-copy $pswd
end
