# Check CLI options
if [ $# -lt 1 ];
then
  echo "USAGE: $0 [-daemon] [-name servicename] [-loggc] classname [opts]"
  exit 1
fi

# Get CLI options
while [ $# -gt 0 ]; do
  COMMAND=$1
  case $COMMAND in
    -name)
      DAEMON_NAME=$2
      CONSOLE_OUTPUT_FILE=$LOG_DIR/$DAEMON_NAME.out
      shift 2
      ;;
    -loggc)
      if [ -z "$KAFKA_GC_LOG_OPTS"] ; then
        GC_LOG_ENABLED="true"
      fi
      shift
      ;;
    -daemon)
      DAEMON_MODE="true"
      shift
      ;;
    *)
      break
      ;;
  esac
done

### process options
while getopts Fd:hHp:L:sv opt
do
	case $opt in
	F)	opt_force=1 ;;
	d)	opt_duration=1; duration=$OPTARG ;;
	p)	opt_pid=1; pid=$OPTARG ;;
	L)	opt_tid=1; tid=$OPTARG ;;
	H)	opt_headers=1 ;;
	s)	opt_stack=1 ;;
	v)	opt_view=1 ;;
	h|?)	usage ;;
	esac
done
shift $(( $OPTIND - 1 ))
(( $# )) || usage
kprobe=$1
shift
if (( $# )); then
	opt_filter=1
	filter=$1
fi
