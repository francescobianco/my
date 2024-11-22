
module hosts

main() {
  args=""


  while [ $# -gt 0 ]; do
      case "$1" in
          -*)
              echo "Option: $1"
              case "$1" in
                  --option1)
                      echo "Handling --option1"
                      ;;
                  -o|--output)
                      echo "Handling $1 with value: $2"
                      shift
                      ;;
                  *)
                      echo "Unknown option: $1"
                      ;;
              esac
              ;;
          *)
              break
              ;;
      esac
      shift # Passa al prossimo argomento
  done

  # Salva i rimanenti argomenti
  args="$*"

  if [ "$#" -eq 0 ]; then
      echo "No arguments supplied"
  fi

  echo "MY_HOSTS: $MY_HOSTS"
  if [ -n "$MY_HOSTS" ]; then
      hosts=$MY_HOSTS
  else
      hosts=$HOME/.hosts
  fi

  if [ "$#" -eq 1 ]; then
      my_print_host "$hosts" "$1"
  fi

  echo "Remaining arguments: $* $#"
}
