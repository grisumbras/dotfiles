if test -d $XDG_CONFIG_HOME/fish/conf.d/rc.d
  for file in $XDG_CONFIG_HOME/fish/conf.d/rc.d/*
    source $file
  end
end
