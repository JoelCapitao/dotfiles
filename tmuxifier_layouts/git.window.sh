# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/elixir-project-git"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "git"

# Split window into panes.
split_v 50

#Run watch git status
run_cmd "git status"
run_cmd "git graph" 1

# Set active pane.
select_pane 1
