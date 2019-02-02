new_window "hugo"
run_cmd "vim ."
split_v 10
run_cmd "git s"
split_h 50
run_cmd "hugo server"
select_pane 1
