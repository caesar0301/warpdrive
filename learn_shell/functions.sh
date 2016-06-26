# help function
display_help() {
  cat <<EOF
Usage: $0 <command> [options]...

commands:
  help                  display this help text
  
global options:
  --conf,-c <conf>      use configs in <conf> directory

EOF
}

# exit function
function die () {
    echo "${@}"
    exit 1
}
