function _red() {
  echo "$FG[009]"
}
function _green() {
  echo "$FG[010]"
}
function _reset_style() {
  echo "%{$(tput sgr0)%}"
}
function _bold() {
  echo "%{$(tput bold)%}"
}

# from https://github.com/shashankmehta/dotfiles/blob/master/thesetup/zsh/.oh-my-zsh/custom/themes/gitster.zsh-theme
function _get_pwd() {
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
      git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
      unset git_root
      prompt_short_dir=%~
  else
      parent=${git_root%\/*}
      prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

function _git_branch() {
  local branch=$(git_current_branch)
  [[ -n "$branch" ]] && echo " ($branch)"
}

function _git_branch_color() {
  if [[ -n "$(__git_prompt_git status --porcelain 2>/dev/null)" ]]; then
    echo "$(_red)"
  else
    echo "$(_green)"
  fi
}

local -a _prompt_arr=()
_prompt_arr+='$(_bold)'
_prompt_arr+='$(_get_pwd)'
_prompt_arr+='$(_git_branch_color)'
_prompt_arr+='$(_git_branch)'
_prompt_arr+='$(_reset_style)'
_prompt_arr+=' '

# join _prompt_arr by empty string
# see https://stackoverflow.com/a/9429887
PROMPT=$(IFS= ; echo "${_prompt_arr[*]}")
