run_http_server() {
  # Check python major version
  PYV=`python -c "import sys;t='{v[0]}'.format(v=list(sys.version_info[:1]));sys.stdout.write(t)";`
  if [ "$PYV" == "3" ]; then
    python -m http.server 8000
  else
    python -m SimpleHTTPServer 8000
  fi
}

abspath() {
  echo $(cd ${1%/*} && echo $PWD/${1##*/})
}
