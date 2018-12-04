set -gx EDITOR vim
set -gx MANPAGER "view -c 'set ft=man' -"

set -gx BOOST_BUILD_PATH $XDG_CONFIG_HOME/boost-build

set -gx COOKIECUTTER_CONFIG $XDG_CONFIG_HOME/cookiecutter/config.yaml

set -gx TASKRC $XDG_CONFIG_HOME/taskwarrior/taskrc

# Shell prompt
set -gx PROMPT_DEFAULT_USER grisumbras
set -gx PROMPT_DISPLAY_USER yes

set -gx PROMPT_DISPLAY_HOSTNAME yes


set -gx PROMPT_MODELS prompt-jobs-model                                       \
                      prompt-sandbox-model                                    \
                      prompt-scm-clear                                        \
                      prompt-git-model


set -gx PROMPT_VIEWS prompt-badges-view                                       \
                     prompt-sandbox-view                                      \
                     prompt-user-view                                         \
                     prompt-pwd-view


set -gx PROMPT_RVIEWS prompt-scm-view

if test x$TERM = xlinux
    set -g PROMPT_LLMARG ''
    set -g PROMPT_LSEP1 ''
    set -g PROMPT_LSEP2 ''
    set -g PROMPT_LRMARG ' '
    set -g PROMPT_RLMARG ' '
    set -g PROMPT_RSEP1 ''
    set -g PROMPT_RSEP2 ''
    set -g PROMPT_RRMARG ''

    set -g PROMPT_MARK_PRIVILEGED '!'
    set -g PROMPT_MARK_JOBS %
    set -g PROMPT_MARK_FAILED X
    set -g PROMPT_MARK_HOME '~'

    set -g PROMPT_MARK_SCM_REPO @
    set -g PROMPT_MARK_SCM_STAGED +
    set -g PROMPT_MARK_SCM_UNSTAGED -
    set -g PROMPT_MARK_SCM_UNTRACKED .
    set -g PROMPT_MARK_SCM_DETACHED ~
    set -g PROMPT_MARK_SCM_BRANCH B
    set -g PROMPT_MARK_SCM_REMOTE_BRANCH R
    set -g PROMPT_MARK_SCM_TAG T
    set -g PROMPT_MARK_SCM_AHEAD A
    set -g PROMPT_MARK_SCM_BEHIND V
    set -g PROMPT_MARK_SCM_DIVERGED X
    set -g PROMPT_MARK_SCM_STASH _
else
    set -g PROMPT_LLMARG ' '
    set -g PROMPT_LSEP1 \uE0B0
    set -g PROMPT_LSEP2 \uE0B1
    set -g PROMPT_LRMARG ' '
    set -gx PROMPT_RLMARG ' '
    set -gx PROMPT_RSEP1 \uE0B2
    set -gx PROMPT_RSEP2 \uE0B3
    set -gx PROMPT_RRMARG ' '

    set -g PROMPT_MARK_PRIVILEGED ⚡
    set -g PROMPT_MARK_JOBS \uF0AD
    set -g PROMPT_MARK_FAILED \uF00D
    set -g PROMPT_MARK_HOME \uF015

    set -g PROMPT_MARK_SCM_REPO \uF02D
    set -g PROMPT_MARK_SCM_STAGED +
    set -g PROMPT_MARK_SCM_UNSTAGED \u2981
    set -g PROMPT_MARK_SCM_UNTRACKED \?
    set -g PROMPT_MARK_SCM_DETACHED \uF074
    set -g PROMPT_MARK_SCM_BRANCH \uF020
    set -g PROMPT_MARK_SCM_REMOTE_BRANCH \uF093
    set -g PROMPT_MARK_SCM_TAG \uF02B
    set -g PROMPT_MARK_SCM_AHEAD ↑
    set -g PROMPT_MARK_SCM_BEHIND ↓
    set -g PROMPT_MARK_SCM_DIVERGED ⇅
    set -g PROMPT_MARK_SCM_STASH \uF0CF
end
