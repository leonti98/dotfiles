# Define the ZLE widget
yazi-open-widget() {
  echo "Clearing input..."
  zle -I
  echo "Switching to alternate screen..."
  tput smcup
  echo "Running yazi..."
  yazi
  local exit_status=$?
  echo "Restoring screen..."
  tput rmcup
  echo "Refreshing prompt..."
  zle reset-prompt
  echo "Exit status: $exit_status"
  return $exit_status
}

# Register the widget with ZLE
zle -N yazi-open-widget

# Bind the widget to a key sequence
bindkey -M emacs '^E' yazi-open-widget   # Bind Ctrl+E in emacs mode
bindkey -M vicmd '^E' yazi-open-widget   # Bind Ctrl+E in vi command mode
bindkey -M viins '^E' yazi-open-widget   # Bind Ctrl+E in vi insert mode
