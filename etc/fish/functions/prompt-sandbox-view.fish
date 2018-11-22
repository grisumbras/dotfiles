function prompt-sandbox-view -d 'Displays sandboxed state'
  [ -n "$PROMPT_SANDBOX_ROOT" ]
  and prompt-put-segment white black \($PROMPT_SANDBOX_TYPE\)
end
