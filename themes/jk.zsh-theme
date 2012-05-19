
# Save a smiley to a local variable if the last command exited with success.
local smiley="%(?,%{$fg[green]%}✔%{$reset_color%},%{$fg[red]%}✗%{$reset_color%})"

# https://github.com/topfunky/zsh-simple
function git_cwd_info () {
  GIT_REPO_PATH=$(git rev-parse --git-dir 2>/dev/null)
  if [[ $GIT_REPO_PATH != '' && $GIT_REPO_PATH != '~' && $GIT_REPO_PATH != "$HOME/.git" ]]; then
    GIT_BRANCH=$(git symbolic-ref -q HEAD | sed 's/refs\/heads\///')
    GIT_COMMIT_ID=$(git rev-parse --short HEAD 2>/dev/null)
    GIT_MODE=''
    if [[ -e "$GIT_REPO_PATH/BISECT_LOG" ]]; then
      GIT_MODE=" +bisect"
    elif [[ -e "$GIT_REPO_PATH/MERGE_HEAD" ]]; then
      GIT_MODE=" +merge"
    elif [[ -e "$GIT_REPO_PATH/rebase" || -e "$GIT_REPO_PATH/rebase-apply" || -e "$GIT_REPO_PATH/rebase-merge" || -e "$GIT_REPO_PATH/../.dotest" ]]; then
      GIT_MODE=" +rebase"
    fi
    GIT_DIRTY=""
    if [[ "$GIT_REPO_PATH" != '.' && `git ls-files -m` != "" ]]; then
      GIT_DIRTY=" ✗"
    fi
    echo "${GIT_BRANCH} ${GIT_COMMIT_ID}${GIT_MODE}${GIT_DIRTY}"
  fi
}

local user_machine="%{$fg[green]%}%n%{$fg[white]%}@%{$fg[green]%}%m"
if [[ $USERNAME == 'root' ]]; then
  local user_machine='%{$fg[red]%}%n%{$fg[white]%}@%{$fg[green]%}%m'
fi

PROMPT='${user_machine} %{$fg[red]%}➜ %{$fg[cyan]%}%4~
${smiley} %{$reset_color%}'

RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt) $(git_cwd_info)%{$reset_color%}'

