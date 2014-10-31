# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/pardot"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "pardot"; then

  # Create a new window inline within session layout definition.
  # new_window "chef"
  # new_window "default"
  # new_window "htop"
  # new_window "tunnel"

  # Load a defined window layout.
  #load_window "example"
  load_window "chef"
  load_window "default"
  load_window "htop"
  load_window "tunnel"

  # Select the default active window on session creation.
  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
