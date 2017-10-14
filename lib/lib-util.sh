function maxlen() {
    width=0
    while read word; do
        c=$(printf "${word}" | wc -c)
        [[ $width -gt $c ]] || width=$c
    done
    echo $width
}

