# auto-init tmux sessions
# adapted from https://superuser.com/a/440082
SESSION_NAME="orderweb"
WINDOW_NAME="orderweb"

tmux has-session -t $SESSION_NAME &> /dev/null

if [ $? != 0 ] 
 then
    # create session with correct dimensions
    # see https://superuser.com/q/354844
    set -- $(stty size) # gets the dimensions of the current screen
    tmux new-session -s "$SESSION_NAME" -n "$WINDOW_NAME" -d -x "$2" -y "$(($1 - 1))" # status line uses a row

    # create left-hand pane
    tmux split-window -t $SESSION_NAME -b -h -l 25

    # split left-hand pane vertically; resize to give upper pane 11 height (status line uses a row)
    tmux split-window -t $SESSION_NAME -d -l "$(($1 - 12))"

    # navigate all panes to correct directory
    tmux send-keys -t $SESSION_NAME.0 oweb ENTER 'zeus start' ENTER
    tmux send-keys -t $SESSION_NAME.1 oweb ENTER C-l
    tmux send-keys -t $SESSION_NAME.2 oweb ENTER C-l

    # navigate to main pane
    # tmux send-keys -t $SESSION_NAME.0 C-b Right
fi

