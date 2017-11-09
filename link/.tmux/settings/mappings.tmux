# remap prefix to Control + a
set -g prefix C-a
unbind C-b
bind C-a send-prefix

# edit configuration
unbind e
bind e new-window -n '.tmux.conf' "sh -c '\${EDITOR:-vim} ~/.tmux.conf && tmux source ~/.tmux.conf && tmux display \"~/.tmux.conf sourced\"'"

# reload configuration
unbind r
bind r source-file ~/.tmux.conf \; display '~/.tmux.conf sourced'

unbind m
bind m set -g mouse on \;

unbind M
bind M set -g mouse off \;

unbind z
bind z \
    new-window -d -n tmux-zoom 'clear' \;\
    swap-pane -s tmux-zoom.0 \;\
    select-window -t tmux-zoom

unbind Z
bind Z \
    last-window \;\
    swap-pane -s tmux-zoom.0 \;\
    kill-window -t tmux-zoom

#################
## PAIN MANAGEMENT
##################

# Ctrl-Left/Right/Up/Down              Move focus among splits
bind-key -n C-Up display-panes \; select-pane -U
bind-key -n C-Down display-panes \; select-pane -D
bind-key -n C-Left display-panes \; select-pane -L
bind-key -n C-Right display-panes \; select-pane -R

# If vim window, (vim-tmux-navigator)
# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
bind-key -T copy-mode-vi C-h select-pane -L
bind-key -T copy-mode-vi C-j select-pane -D
bind-key -T copy-mode-vi C-k select-pane -U
bind-key -T copy-mode-vi C-l select-pane -R
bind-key -T copy-mode-vi C-\ select-pane -l

# Shift-Left/Right/Up/Down             Resize the current split by 1
bind-key -n S-Up display-panes \; resize-pane -U
bind-key -n S-Down display-panes \; resize-pane -D
bind-key -n S-Left display-panes \; resize-pane -L
bind-key -n S-Right display-panes \; resize-pane -R

# Ctrl-Shift-Left/Right/Up/Down        Resize the current split by 10
bind-key -n C-S-Up display-panes \; resize-pane -U 10
bind-key -n C-S-Down display-panes \; resize-pane -D 10
bind-key -n C-S-Left display-panes \; resize-pane -L 10
bind-key -n C-S-Right display-panes \; resize-pane -R 10

# Alt-,/.                              Move focus among windows
bind-key -n M-, previous-window
bind-key -n M-. next-window

# Alt-[/]                              Move focus among sessions
bind-key -n M-[ switch-client -p
bind-key -n M-] switch-client -n

# Alt-Shift-Left/Right/Up/Down         Create a new split in the given direction
bind-key -n M-S-Left split-window -h -c "#{pane_current_path}" \; swap-pane -s :. -t :.- \; select-pane -t :.- \; display-panes
bind-key -n M-S-Up split-window -v -c "#{pane_current_path}" \; swap-pane -s :. -t :.- \; select-pane -t :.- \; display-panes
bind-key -n M-S-Right display-panes \; split-window -h -c "#{pane_current_path}"
bind-key -n M-S-Down display-panes \; split-window -v -c "#{pane_current_path}"

# Ctrl-Shift-Left/Right                Swap the current split with another
bind-key -n C-S-Left display-panes \; swap-pane -s :. -t :.- \; select-pane -t :.-
bind-key -n C-S-Right display-panes \; swap-pane -s :. -t :.+ \; select-pane -t :.+

# Ctrl-Shift-Up                        Balance panes horizontally
# bind-key -n C-S-Up display-panes \; select-layout even-horizontal

# Ctrl-Alt-Space                       Cycle through pane layouts
bind-key -n C-M-Space display-panes \; next-layout

# Ctrl-Shift-Delete                    Kill current focused split
bind-key -n C-S-DC kill-pane
