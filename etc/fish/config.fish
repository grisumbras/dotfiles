set -gx USER_ROOT $HOME/.local
set -gx XDG_CONFIG_HOME $USER_ROOT/etc
set -gx XDG_DATA_HOME $USER_ROOT/share
set -gx XDG_CACHE_HOME $USER_ROOT/var/tmp

set -l here (dirname (status --current-filename))

status --is-login; and source $here/conf.d/profile.fish
status --is-interactive; and source $here/conf.d/rc.fish
status --is-login; and source $here/conf.d/login.fish
