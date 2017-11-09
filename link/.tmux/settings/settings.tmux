set -g default-terminal "screen-256color" # colors!
setw -g xterm-keys on
set -s escape-time 0                      # fastest command sequences
set -sg repeat-time 600                   # increase repeat timeout
set -s focus-events on

set -q -g status-utf8 on                  # expect UTF-8 (tmux < 2.2)
setw -q -g utf8 on

# Update status frequently.
set-option -g status-interval 2

# Increase history size
set -g history-limit 50000

# Mouse mode settings
set -g mouse on

# Don't rename windows automatically
set-option -g allow-rename off
