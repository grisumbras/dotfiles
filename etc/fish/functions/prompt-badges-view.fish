function prompt-badges-view -d 'Displays badges for various states'
  set -l msg

  # if superuser (uid == 0)
  [ (id -u $USER) -eq 0 ]; and set msg $msg (set_color yellow)$PROMPT_MARK_PRIVILEGED

  # Jobs display
  if [ $PROMPT_MODEL_JOBS -gt 0 ]
    set -l job_badge (set_color cyan)$PROMPT_MARK_JOBS

    [ $PROMPT_MODEL_JOBS -gt 1 ]
    and set job_badge "$job_badge$PROMPT_MODEL_JOBS"

    set msg $msg $job_badge
  end

  [ $PROMPT_STATUS -gt 0 ]; and set msg $msg (set_color red)$PROMPT_MARK_FAILED

  if [ (count $msg) -ge 1 ]
    prompt-new-segment black cyan
    echo -n $msg
  end
end
