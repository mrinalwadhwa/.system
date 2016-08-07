
function git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

function git_is_dirty {
  test -n "$(git status --porcelain)"
}
