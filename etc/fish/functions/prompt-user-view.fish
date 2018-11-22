function prompt-user-view \
  -d 'Display current user if different from $PROMPT_DEFAULT_USER'

  set -l msg

  [ "$PROMPT_DISPLAY_HOSTNAME" = "yes" -a -n "$SSH_CLIENT" ]
  and set msg (hostname)

  if [  "$PROMPT_DISPLAY_USER" = "yes"                              \
     -a \( "$USER" != "$PROMPT_DEFAULT_USER" -o -n "$SSH_CLIENT" \) \
     ]
    set msg @$msg
    set msg "$USER$msg"
  end

  [ "$msg" ]; and prompt-put-segment black yellow $msg
end
