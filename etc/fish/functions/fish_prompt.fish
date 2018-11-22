function fish_prompt
  set -gx PROMPT_STATUS $status

  __prompt-run-models

  set -gx PROMPT_LEFT 1
  set -eg PROMPT_RIGHT
  set -gx PROMPT_CUR_BG

  __prompt-run-views

  prompt-new-segment normal
  set_color normal

  set -eg PROMPT_LEFT
  set -eg PROMPT_CUR_BG
end


# ==================
# Painting functions
# ==================

function prompt-new-segment -a bg fg -d 'Starts a new segment'

  if set -gq PROMPT_LEFT
    __prompt-left-segment $bg $fg
  else if set -gq PROMPT_RIGHT
    __prompt-right-segment $bg $fg
  else
    return 1
  end

  set PROMPT_CUR_BG $bg
end


function prompt-put-segment -a bg fg msg -d 'Prints message in a new segment'
  prompt-new-segment $bg $fg
  set_color $fg
  echo -n -s $msg
end


# ===========================
# Helpers
# ===========================


function __prompt-run-models -d 'Initializes models'
  for model in $PROMPT_MODELS; eval $model; end
end


function __prompt-run-views -d 'Paints views'
  for view in $PROMPT_VIEWS; eval $view; end
end


function __prompt-left-segment -a bg fg -d 'Starts segment for left prompt'
  if [ -z "$PROMPT_CUR_BG" ]
    set_color -b $bg
    set_color $fg
  else
    echo -n $PROMPT_LRMARG
    if [ "$PROMPT_CUR_BG" != "$bg" ]
      set_color -b $bg
      set_color $PROMPT_CUR_BG
      echo -n $PROMPT_LSEP1
      set_color $fg
    else
      set_color $fg
      echo -n $PROMPT_LSEP2
    end
  end
  echo -n $PROMPT_LLMARG
end


function __prompt-right-segment -a bg fg -d 'Starts segment for right prompt'
  echo -n $PROMPT_RRMARG
  if [ "$PROMPT_CUR_BG" = "$bg" ]
    set_color $fg
    echo -n $PROMPT_RSEP2$PROMPT_RLMARG
  else
    set_color $bg
    echo -n $PROMPT_RSEP1

    set_color $fg
    set_color -b $bg
    echo -n $PROMPT_RLMARG
  end
end
