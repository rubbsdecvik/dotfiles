# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/htop"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "htop"

# Split window into panes.
#split_v 20
split_hl 80

# Run commands.
run_cmd "sudo htop" 1
run_cmd "brew update" 2
run_cmd "brew upgrade" 2

# Paste text
#send_keys "top"    # paste into active pane
send_keys "P" 1 # paste into pane 1

# Set active pane.
select_pane 2
