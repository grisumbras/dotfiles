if test -d $XDG_CONFIG_HOME/fish/conf.d/profile.d
  for file in $XDG_CONFIG_HOME/fish/conf.d/profile.d/*
    source $file
  end
end
