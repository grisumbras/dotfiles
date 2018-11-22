function prompt-sandbox-model -d 'Updates sandboxed state'
  if [ -n "$VIRTUAL_ENV" ]
    set -gx PROMPT_SANDBOX_TYPE python-virtualenv
    set -gx PROMPT_SANDBOX_ROOT (basename $VIRTUAL_ENV)
  else if [ -n "$CONAN_ENV" ]
    set -gx PROMPT_SANDBOX_TYPE conan-env
    set -gx PROMPT_SANDBOX_ROOT $CONAN_ENV
  else
    set -ge PROMPT_SANDBOX_ROOT
    set -ge PROMPT_SANDBOX_TYPE
  end
end
