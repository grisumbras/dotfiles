function fish_right_prompt -d 'Write out the right prompt'
  set -gx PROMPT_RIGHT
  set -gx PROMPT_CUR_BG normal

  for view in $PROMPT_RVIEWS; eval $view; end
  echo -n $PROMPT_RRMARG

  set_color normal
  set_color -b normal

  set -eg PROMPT_CUR_BG
  set -eg PROMPT_RIGHT
end
