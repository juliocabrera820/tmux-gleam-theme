# Gleam Theme for tmux - Complete version with all features
# Based on Gleam's color palette

#############################################
# BASIC CONFIGURATION
#############################################

# Status bar configuration
set -g status "on"
set -g status-justify "left"
set -g status-interval "1"
set -g status-style "fg=#fefefc,bg=#292d3e"

#############################################
# LEFT BAR - SESSION INFORMATION
#############################################

set -g status-left-length "150"
set -g status-left "\
#[fg=#1e1e1e,bg=#ffaff3,bold] #S \
#[fg=#ffaff3,bg=#584355]#[fg=#fefefc,bg=#584355] #(whoami) \
#[fg=#584355,bg=#292d3e]#[fg=#a6f0fc,bg=#292d3e] \
#{?client_prefix,#[fg=#fffbe8]⌨ PREFIX ,}\
#{?pane_in_mode,#[fg=#ffaff3]✂ COPY ,}\
#{?window_zoomed_flag,#[fg=#a6f0fc]🔍 ZOOM ,}\
"

#############################################
# RIGHT BAR - SYSTEM AND DATE/TIME
#############################################

set -g status-right-length "200"
set -g status-right "\
#[fg=#584355,bg=#292d3e]\
#[fg=#ffaff3,bg=#584355]#[fg=#1e1e1e,bg=#ffaff3] \
%H:%M:%S %d-%b-%Y \
"

#############################################
# WINDOW FORMAT
#############################################

# Window separator
set -g window-status-separator ""

# Inactive windows
set -g window-status-format "\
#[fg=#584355,bg=#292d3e] #I \
#[fg=#fefefc,bg=#292d3e] #W \
#{?window_last_flag,#[fg=#ffaff3]󰊠 ,}\
#{?window_activity_flag,#[fg=#fffbe8]● ,}\
#{?window_bell_flag,#[fg=#ffaff3]⚠ ,}\
#{?window_zoomed_flag,#[fg=#a6f0fc]🔍 ,}\
#[fg=#292d3e,bg=#292d3e] \
"

# Active window
set -g window-status-current-format "\
#[fg=#292d3e,bg=#584355]#[fg=#fefefc,bg=#584355,bold] #I \
#[fg=#fefefc,bg=#584355,bold] #W \
#[fg=#a6f0fc,bg=#584355]#{?window_zoomed_flag,🔍 ,}\
#[fg=#ffaff3]#(ps -t #{pane_tty} -o args= | grep -q ssh && echo \"🌐 \")\
#[fg=#584355,bg=#292d3e,nobold] \
"

# Styles for windows with activity, alerts, etc.
set -g window-status-activity-style "fg=#fffbe8,bg=#292d3e"
set -g window-status-bell-style "fg=#ffaff3,bg=#292d3e,bold"
set -g window-status-last-style "fg=#a6f0fc,bg=#292d3e"

#############################################
# PANES
#############################################

# Pane borders
set -g pane-border-style "fg=#2f2f2f,bg=default"
set -g pane-active-border-style "fg=#a6f0fc,bg=default"

# Add labels on borders to identify panes
set -g pane-border-format "\
#[fg=#292d3e,bg=#584355]#[fg=#fefefc,bg=#584355,bold] #P \
#[fg=#fefefc,bg=#584355] #{pane_current_command} \
#[fg=#a6f0fc]#{?pane_active,● ,}#[fg=#584355,bg=#292d3e] \
"
set -g pane-border-status "top"

#############################################
# MESSAGES AND MODES
#############################################

# Messages
set -g message-style "fg=#fefefc,bg=#584355,bold"
set -g message-command-style "fg=#fefefc,bg=#584355,bold"

# Modes (copy, selection, etc.)
set -g mode-style "fg=#1e1e1e,bg=#ffaff3,bold"

#############################################
# ADDITIONAL OPTIONS
#############################################

# Show activity indicator
set -g monitor-activity on
# Show visual bell for activity
set -g visual-bell on
# Don't show activity message
set -g visual-activity off
# Status bar update interval
set -g status-interval 0
