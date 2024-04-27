complete -c lpass-copy \
    -a "(lpass ls | sed -e 's/ \[id.*//g' -e 's/(none)\///g')" -f
