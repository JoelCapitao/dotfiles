# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/ownCloud/Development/batcave"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "batcave"; then

  # Load a defined window layout.
  load_window "batcave"
  load_window "bash"

  # Select the default active window on session creation.
  select_window 0

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
