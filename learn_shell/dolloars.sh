# POSIX standard $ commands
$0   Stores the first word of the entered command (the name of the shell program).
$@   Stores all the arguments that were entered on the command line, individually quoted ("$1" "$2" ...).
$#   Stores the number of command-line arguments that were passed to the shell program.
$*   Stores all the arguments that were entered on the command line ($1 $2 ...).
$?   Expands to the decimal exit status of the most recent pipeline.
$$   Expands to the decimal process ID of the invoked shell.
$!   Expands to the decimal process ID of the most recent background command executed from the current shell.

${@:$#} The last argument of command line