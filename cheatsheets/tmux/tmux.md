## Session Management
* ` tmux new -s session_name `
    creates a new tmux session named session_name
* ` tmux attach -t session_name `
    attaches to an existing tmux session named session_name
* ` tmux switch -t session_name `
    switches to an existing session named session_name
* ` tmux ls `
    lists existing tmux sessions
* ` tmux detach (prefix + d)`
    detach the currently attached session
* ` tmux kill-session -t session_name `
    kill specific session
 
## Windows
* ` tmux new-window (prefix + c)`
    create a new window
* ` tmux select-window -t :0-9 (prefix + 0-9)`
    move to the window based on index
* ` tmux rename-window (prefix + ,)`
    rename the current window
* ` tmux kill-window (prefix + &)`
    kill the current window
    
## Panes
* `tmux split-window ( prefix + " )`
    splits the window into two horizontal panes
* `tmux split-window -h ( prefix + % )`
    splits the window into two vertical panes
* `tmux swap-pane -[UDLR] ( prefix + { or } )`
    swaps pane with another in the specified direction
* `tmux select-pane -[UDLR]`
    selects the next pane in the specified direction
* `tmux select-pane -t :.+ ( prefix + q + number )`
    selects the next pane in numerical order
* `tmux kill-pane ( prefix + x )`
    kill current pane

## Helpful commands
* `tmux list-keys`
    lists out every bound key and the tmux command it runs
* `tmux list-commands`
    lists out every tmux command and its arguments
* `tmux info`
    lists out every session, window, pane, its pid, etc.
* `tmux source-file ~/.tmux.conf`
    reloads the current tmux configuration (based on a default tmux config)
    
## Tmux plugins manager
* prefix + I (capital) install new plugin
* prefix  + U update plugins
* prefix + alt + u remove plugins not on the plugin list
