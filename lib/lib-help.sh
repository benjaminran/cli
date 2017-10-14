function help_lines() {
    filename="${1}"
    cat "${CLI_DIR}/lib/${filename}" | tail -n +2 | while read l; do
        [[ "${l}" =~ ^#\  ]] && echo "${l:2}" || break
    done
}

function short_desc() {
    filename="${1}"
    help_lines "${filename}" | head -n 1
}

function long_desc() {
    filename="${1}"
    help_lines "${filename}" | tail -n +2
}