new_window "dotfiles"
run_cmd "vim ."
split_v 10
run_cmd "git s"
split_h 50
run_cmd "find . | entr sh -c 'make test'"
select_pane 1
