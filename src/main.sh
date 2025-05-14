#extern package error

module hosts

main() {
  local list

  while [ $# -gt 0 ]; do
    case "$1" in
      -*)
        case "$1" in
          --list)
            list=true
            shift
            ;;
          -o|--output)
            echo "Handling $1 with value: $2"
            shift
            ;;
          *)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
        esac
        ;;
      *)
        break
        ;;
    esac
    shift
  done || true

  if [ -n "$MY_HOSTS" ]; then
    hosts=$MY_HOSTS
  else
    hosts=$HOME/.hosts
  fi

  if [ -n "$list" ]; then
    my_print_list "$hosts"
    exit
  fi

  if [ "$#" -eq 0 ]; then
    error "No arguments supplied" 1
  fi

  if [ "$#" -eq 1 ]; then
    my_print_host "$hosts" "$1"
    exit
  fi
}
