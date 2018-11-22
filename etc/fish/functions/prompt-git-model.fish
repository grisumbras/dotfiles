function prompt-git-model -d 'Checks if current directory is managed by git'
  not set -q PROMPT_SCM_TYPE
  and command-exists git
  and __prompt-git-is-repo
  or return

  set -gx PROMPT_SCM_TYPE git
  set -gx PROMPT_SCM_ROOT (__prompt-git-root)
  __prompt-git-ref | read -gx PROMPT_SCM_REFICON PROMPT_SCM_REFNAME

  set -gx PROMPT_SCM_STASHED (__prompt-git-stashed)
  test "$PROMPT_SCM_STASHED" -eq 0; and set -e PROMPT_SCM_STASHED

  __prompt-git-changes | read -gx PROMPT_SCM_STAGED                           \
                                  PROMPT_SCM_UNSTAGED                         \
                                  PROMPT_SCM_UNTRACKED
  test "$PROMPT_SCM_STAGED" -eq 0; and set -e PROMPT_SCM_STAGED
  test "$PROMPT_SCM_UNSTAGED" -eq 0; and set -e PROMPT_SCM_UNSTAGED
  test "$PROMPT_SCM_UNTRACKED" -eq 0; and set -e PROMPT_SCM_UNTRACKED


  __prompt-git-remote-status | read -gx PROMPT_SCM_BEHIND PROMPT_SCM_AHEAD
  test "$PROMPT_SCM_BEHIND" -eq 0; and set -e PROMPT_SCM_BEHIND
  test "$PROMPT_SCM_AHEAD" -eq 0; and set -e PROMPT_SCM_AHEAD

  true
end


function __prompt-git-is-repo
  git rev-parse --is-inside-work-tree >/dev/null ^&1
end


function __prompt-git-root
  git rev-parse --show-toplevel ^/dev/null
end


function __prompt-git-ref
  set -l ref
  if set ref (git symbolic-ref HEAD ^/dev/null)
    echo $ref | sed "s-^refs/heads/-$PROMPT_MARK_SCM_BRANCH\t-"
  else if set ref (git describe --exact-match --all HEAD ^/dev/null)
    echo $ref | sed -e "s-^tags/-$PROMPT_MARK_SCM_TAG\t-"                      \
                    -e "s-^remotes/origin/-$PROMPT_MARK_SCM_REMOTE_BRANCH\t-"
  else
    echo $PROMPT_SCM_MARK_DETACHED ( git show-ref --head -s --abbrev          \
                                   | head -n1 ^/dev/null)
  end
end


function __prompt-git-stashed
  git stash list | wc -l
end


function __prompt-git-changes
  set -l staged
  set -l unstaged
  set -l untracked
  set -l ln
  for ln in (git status --porcelain --ignore-submodules=dirty ^/dev/null)
    set -l file (string sub -s4 $ln)
    set -l index_stat (string sub -s1 -l1 $ln)
    if [ $index_stat = \? ]
      set untracked $untracked "$file"
    else
      test $index_stat != ' '
      and set staged $staged "$file"

      test (string sub -s2 -l1 $ln) != ' '
      and set unstaged $unstaged "$file"
    end
  end
  echo (count $staged) (count $unstaged) (count $untracked)
end

function __prompt-git-remote-status
  git rev-list --count --left-right @\{upstream\}...HEAD ^/dev/null
  or echo 0\t0
end


function __prompt-git_number_of_files_to_merge
  command git ls-files --unmerged | cut -d\t -f2 | uniq
end

