function command-exists -d 'Checks if command exists'
  set -l throwaway (type $argv ^/dev/null)
end
