function prompt-scm-clear -d 'Clear SCM model state'
  set -ge PROMPT_SCM_TYPE
  set -ge PROMPT_SCM_ROOT
  set -ge PROMPT_SCM_REF
  set -ge PROMPT_SCM_DIRTY
  set -ge PROMPT_SCM_BEHIND
  set -ge PROMPT_SCM_AHEAD
end
