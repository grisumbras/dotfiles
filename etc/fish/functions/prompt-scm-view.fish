function prompt-scm-view -d 'Displays SCM state for current directory'
  set -q PROMPT_SCM_TYPE; or return

  set -l bg_color

  set -l changes ''
  set -q PROMPT_SCM_STAGED; and set changes $PROMPT_MARK_SCM_STAGED
  set -q PROMPT_SCM_UNSTAGED; and set changes $changes$PROMPT_MARK_SCM_UNSTAGED

  set -q PROMPT_SCM_UNTRACKED
  and set changes $changes$PROMPT_MARK_SCM_UNTRACKED

  if [ -n $changes ]
    set changes \ $changes
    if set -q PROMPT_SCM_UNTRACKED
      set bg_color red
    else if set -q PROMPT_SCM_UNSTAGED
      set bg_color yellow
    else
      set bg_color green
    end
  else
    set bg_color grey
  end

  set -l stashed ''
  set -q PROMPT_SCM_STASHED; and set stashed \ $PROMPT_MARK_SCM_STASH

  set -l commits ''
  if set -q PROMPT_SCM_BEHIND
    if set -q PROMPT_SCM_AHEAD
      set commits $PROMPT_MARK_SCM_DIVERGED
      set bg_color magenta
    else
      set commits $PROMPT_MARK_SCM_BEHIND
    end
  else if set -q PROMPT_SCM_AHEAD
    set commits $PROMPT_MARK_SCM_AHEAD
  end

  set -l msg $PROMPT_SCM_REFICON$PROMPT_SCM_REFNAME$commits$changes$stashed
  prompt-put-segment $bg_color black "$msg"
end

