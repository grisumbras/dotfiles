if test -d $XDG_CONFIG_HOME/fish/conf.d/login.d
  for file in $XDG_CONFIG_HOME/fish/conf.d/login.d/*.fish
    source $file
  end
end
