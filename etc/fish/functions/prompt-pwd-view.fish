function prompt-pwd-view -d 'Display the current directory'
  set -l root
  if set -q PROMPT_SCM_ROOT
    set root $PROMPT_SCM_ROOT $PROMPT_MARK_SCM_REPO(basename $PROMPT_SCM_ROOT)
  else
    set root ~ $PROMPT_MARK_HOME
  end

  set -l path
  echo $PWD | sed -e "s|^\($root[1]\)|+\t|" -e "s/^\([^+]\)/-\t\1/"  \
            | read match path
  [ $match != "+" ]; and set root[2] ''
  set path $root[2](echo $path | sed 's-\([^/.]\)[^/]*/-\1/-g')

  set -gx PROMPT_PWD_ROOT $root[1]

  set -l bg_color
  [ -w $PWD ];
  and set bg_color blue
  or set bg_color red

  prompt-put-segment $bg_color black $path
end
