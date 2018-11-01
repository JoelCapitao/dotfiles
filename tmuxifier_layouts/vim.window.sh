new_window "vim"
run_cmd "cd .vim && vim ."
split_v 10
run_cmd "cd .vim && git s"
select_pane 1
