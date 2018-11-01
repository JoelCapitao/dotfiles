new_window "dotfiles"
run_cmd "cd ownCloud/Development/dotfiles && vim ."
split_v 10
run_cmd "cd ownCloud/Development/dotfiles && git s"
select_pane 1
