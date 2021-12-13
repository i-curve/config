set -g mouse on

set -g base-index 1
set -g pane-base-index 1

set-option -g default-shell "/bin/bash"
set -g default-terminal "tmux-256color"
setw -g monitor-activity on

setw -g mode-keys vi

bind-key k select-pane -U # up
 
bind-key j select-pane -D # down
 
bind-key h select-pane -L # left
 
bind-key l select-pane -R # right

bind -n C-k clear-history

bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
bind 'c' new-window -c "#{pane_current_path}"
