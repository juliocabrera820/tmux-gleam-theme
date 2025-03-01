#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
    tmux set -g status "on"
    tmux set -g status-justify "left"
    tmux set -g status-interval "1"
    tmux set -g status-style "fg=#fefefc,bg=#292d3e"

    tmux set -g status-left-length "150"
    tmux set -g status-left "\
#[fg=#1e1e1e,bg=#ffaff3,bold] #S \
#[fg=#ffaff3,bg=#584355]#[fg=#fefefc,bg=#584355] #(whoami) \
#[fg=#584355,bg=#292d3e]#[fg=#a6f0fc,bg=#292d3e] \
#{?client_prefix,#[fg=#fffbe8]⌨ PREFIX ,}\
#{?pane_in_mode,#[fg=#ffaff3]✂ COPY ,}\
#{?window_zoomed_flag,#[fg=#a6f0fc]🔍 ZOOM ,}"

    tmux set -g status-right-length "200"
    tmux set -g status-right "\
#[fg=#584355,bg=#292d3e]\
#[fg=#ffaff3,bg=#584355]#[fg=#1e1e1e,bg=#ffaff3] \
%H:%M:%S %d-%b-%Y "

    # Window separator
    tmux set -g window-status-separator ""

    # Inactive windows
    tmux set -g window-status-format "\
#[fg=#584355,bg=#292d3e] #I \
#[fg=#fefefc,bg=#292d3e] #W \
#{?window_last_flag,#[fg=#ffaff3]󰊠 ,}\
#{?window_activity_flag,#[fg=#fffbe8]● ,}\
#{?window_bell_flag,#[fg=#ffaff3]⚠ ,}\
#{?window_zoomed_flag,#[fg=#a6f0fc]🔍 ,}\
#[fg=#292d3e,bg=#292d3e] "

    # Active window
    tmux set -g window-status-current-format "\
#[fg=#292d3e,bg=#584355]#[fg=#fefefc,bg=#584355,bold] #I \
#[fg=#fefefc,bg=#584355,bold] #W \
#[fg=#a6f0fc,bg=#584355]#{?window_zoomed_flag,🔍 ,}\
#[fg=#ffaff3]#(ps -t #{pane_tty} -o args= | grep -q ssh && echo \"🌐 \")\
#[fg=#584355,bg=#292d3e,nobold] "

    # Styles for windows
    tmux set -g window-status-activity-style "fg=#fffbe8,bg=#292d3e"
    tmux set -g window-status-bell-style "fg=#ffaff3,bg=#292d3e,bold"
    tmux set -g window-status-last-style "fg=#a6f0fc,bg=#292d3e"

    # Pane borders
    tmux set -g pane-border-style "fg=#2f2f2f,bg=default"
    tmux set -g pane-active-border-style "fg=#a6f0fc,bg=default"

    # Pane borders format
    tmux set -g pane-border-format "\
#[fg=#292d3e,bg=#584355]#[fg=#fefefc,bg=#584355,bold] #P \
#[fg=#fefefc,bg=#584355] #{pane_current_command} \
#[fg=#a6f0fc]#{?pane_active,● ,}#[fg=#584355,bg=#292d3e] "
    tmux set -g pane-border-status "top"

    # Messages and modes
    tmux set -g message-style "fg=#fefefc,bg=#584355,bold"
    tmux set -g message-command-style "fg=#fefefc,bg=#584355,bold"
    tmux set -g mode-style "fg=#1e1e1e,bg=#ffaff3,bold"

    # Additional options
    tmux set -g monitor-activity on
    tmux set -g visual-bell on
    tmux set -g visual-activity off
    tmux set -g status-interval 1
}

main