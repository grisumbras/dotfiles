set -gx PATH "$USER_ROOT/bin" \
  /usr/local/sbin \
  /usr/local/bin \
  /usr/sbin \
  /usr/bin \
  /sbin \
  /bin \
  /usr/local/games \
  /usr/games \
  /snap/bin

set -gx LD_LIBRARY_PATH "$USER_ROOT/lib"

set -gx GNUPGHOME $XDG_CONFIG_HOME/gnupg
