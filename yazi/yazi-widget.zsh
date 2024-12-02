yazi-open-widget() {
  zle -I                # Clear ZLE input
  unset ZLE_RPROMPT_INDENT   # Prevent ZLE prompt issues
  
  # Disable ZLE temporarily by creating a subshell
  (
    stty -ixon          # Disable flow control to avoid key conflicts
    yazi < /dev/tty     # Attach Yazi directly to the terminal
  )

  zle reset-prompt      # Refresh ZLE prompt after Yazi exits
  return $?             # Return Yazi's exit status
}

# Register the widget with ZLE
zle -N yazi-open-widget

# Bind the widget to a key sequence
bindkey -M emacs '^E' yazi-open-widget   # Ctrl+E in emacs mode
bindkey -M vicmd '^E' yazi-open-widget   # Ctrl+E in vi command mode
bindkey -M viins '^E' yazi-open-widget   # Ctrl+E in vi insert mode
