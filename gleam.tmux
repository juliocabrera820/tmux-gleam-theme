#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Color definitions
readonly COLOR_BLACK="#1e1e1e"
readonly COLOR_WHITE="#fefefc"
readonly COLOR_PINK="#ffaff3"
readonly COLOR_BLUE="#a6f0fc"
readonly COLOR_YELLOW="#fffbe8"
readonly COLOR_AUBERGINE="#584355"
readonly COLOR_UNDERWATER="#292d3e"
readonly COLOR_CHARCOAL="#2f2f2f"

set_status_bar() {
    # Basic status bar configuration
    tmux set -g status "on"
    tmux set -g status-justify "left"
    tmux set -g status-interval "1"
    tmux set -g status-style "fg=$COLOR_WHITE,bg=$COLOR_UNDERWATER"
}

set_left_status() {
    tmux set -g status-left-length "150"
    tmux set -g status-left "\
#[fg=$COLOR_BLACK,bg=$COLOR_PINK,bold] #S \
#[fg=$COLOR_PINK,bg=$COLOR_AUBERGINE]#[fg=$COLOR_WHITE,bg=$COLOR_AUBERGINE] #(whoami) \
#[fg=$COLOR_AUBERGINE,bg=$COLOR_UNDERWATER]#[fg=$COLOR_BLUE,bg=$COLOR_UNDERWATER] \
#{?client_prefix,#[fg=$COLOR_YELLOW]⌨ PREFIX ,}\
#{?pane_in_mode,#[fg=$COLOR_PINK]✂ COPY ,}\
#{?window_zoomed_flag,#[fg=$COLOR_BLUE]🔍 ZOOM ,}"
}

set_right_status() {
    tmux set -g status-right-length "200"
    tmux set -g status-right "\
#[fg=$COLOR_AUBERGINE,bg=$COLOR_UNDERWATER]\
#[fg=$COLOR_PINK,bg=$COLOR_AUBERGINE]#[fg=$COLOR_BLACK,bg=$COLOR_PINK] \
%H:%M:%S %d-%b-%Y "
}

set_window_format() {
    # Window separator
    tmux set -g window-status-separator ""

    # Inactive windows
    tmux set -g window-status-format "\
#[fg=$COLOR_AUBERGINE,bg=$COLOR_UNDERWATER] #I \
#[fg=$COLOR_WHITE,bg=$COLOR_UNDERWATER] #W \
#{?window_last_flag,#[fg=$COLOR_PINK]󰊠 ,}\
#{?window_activity_flag,#[fg=$COLOR_YELLOW]● ,}\
#{?window_bell_flag,#[fg=$COLOR_PINK]⚠ ,}\
#{?window_zoomed_flag,#[fg=$COLOR_BLUE]🔍 ,}\
#[fg=$COLOR_UNDERWATER,bg=$COLOR_UNDERWATER] "

    # Active window
    tmux set -g window-status-current-format "\
#[fg=$COLOR_UNDERWATER,bg=$COLOR_AUBERGINE]#[fg=$COLOR_WHITE,bg=$COLOR_AUBERGINE,bold] #I \
#[fg=$COLOR_WHITE,bg=$COLOR_AUBERGINE,bold] #W \
#[fg=$COLOR_BLUE,bg=$COLOR_AUBERGINE]#{?window_zoomed_flag,🔍 ,}\
#[fg=$COLOR_PINK]#(ps -t #{pane_tty} -o args= | grep -q ssh && echo \"🌐 \")\
#[fg=$COLOR_AUBERGINE,bg=$COLOR_UNDERWATER,nobold] "
}

set_window_styles() {
    tmux set -g window-status-activity-style "fg=$COLOR_YELLOW,bg=$COLOR_UNDERWATER"
    tmux set -g window-status-bell-style "fg=$COLOR_PINK,bg=$COLOR_UNDERWATER,bold"
    tmux set -g window-status-last-style "fg=$COLOR_BLUE,bg=$COLOR_UNDERWATER"
}

set_pane_styles() {
    # Pane borders
    tmux set -g pane-border-style "fg=$COLOR_CHARCOAL,bg=default"
    tmux set -g pane-active-border-style "fg=$COLOR_BLUE,bg=default"

    # Pane borders format
    tmux set -g pane-border-format "\
#[fg=$COLOR_UNDERWATER,bg=$COLOR_AUBERGINE]#[fg=$COLOR_WHITE,bg=$COLOR_AUBERGINE,bold] #P \
#[fg=$COLOR_WHITE,bg=$COLOR_AUBERGINE] #{pane_current_command} \
#[fg=$COLOR_BLUE]#{?pane_active,● ,}#[fg=$COLOR_AUBERGINE,bg=$COLOR_UNDERWATER] "
    tmux set -g pane-border-status "top"
}

set_message_styles() {
    tmux set -g message-style "fg=$COLOR_WHITE,bg=$COLOR_AUBERGINE,bold"
    tmux set -g message-command-style "fg=$COLOR_WHITE,bg=$COLOR_AUBERGINE,bold"
    tmux set -g mode-style "fg=$COLOR_BLACK,bg=$COLOR_PINK,bold"
}

set_additional_options() {
    tmux set -g monitor-activity on
    tmux set -g visual-bell on
    tmux set -g visual-activity off
    tmux set -g status-interval 1
}

main() {
    set_status_bar
    set_left_status
    set_right_status
    set_window_format
    set_window_styles
    set_pane_styles
    set_message_styles
    set_additional_options
}

main