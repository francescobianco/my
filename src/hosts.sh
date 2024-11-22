
function my_print_host() {
    local hosts
    local search
    local variables

    hosts=$1
    search=$2

    variables=$(grep "name=${search}" "${hosts}" | head -1)

    if [ -z "$variables" ]; then
        echo "No such host by: ${search}" >&2
        exit 1
    fi

    for variable in $variables; do
      declare "$variable"
    done

    echo "${host}"
}
