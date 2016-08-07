
function prompt_color(){
  case $# in
    3) echo -en "\[\033[$2\]\[\033[$3\]\[$1\033[0m\]";;
    2) echo -en "\[\033[$2\]$1\[\033[0m\]";;
    1) echo -en "$1";;
    *) echo -en "";;
  esac
}

function git_branch(){
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

function git_is_dirty(){
  test -n "$(git status --porcelain)"
}

function build_prompt(){
  local last_command=$? # Capture exit status of teh last command

  PS1="\n" # Start with a line break

  # If the last command failed
  if [[ "$last_command" != "0" ]]; then
    # Add a red prefix to the prompt
    PS1+="$(prompt_color " " "31m" "41m" )"
  fi

  # If the current folder is a git repo
  if [ "$(git_branch)" != "" ]; then
    local fg2="30m"
    local bg2="46m"
    local fg21="36m"
    local bg21="40m"
    if git_is_dirty; then
      # if there are uncommitted changes, make the git branch part brighter
      bg2="47m"
      fg21="37m"
    fi
    # Add the current git branch to the prompt
    PS1+="$(prompt_color "  \$(git_branch) " "$fg2" "$bg2" )"
    PS1+="$(prompt_color "" "$fg21" "$bg21" )"
  fi

  local fg1="m"
  local bg1="40m"
  local fg10="30m"
  local fg0="m"

  # Show the current path
  PS1+="$(prompt_color "  \w " "$fg1" "$bg1" )$(prompt_color "" "$fg10") "
  PS1+="\n\n$(prompt_color "» " "$fg0")"

  PS2="$(prompt_color "» " "$fg0")"
}

# http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x264.html
# http://stackoverflow.com/a/16343345
export PROMPT_COMMAND='build_prompt'



# History Management

shopt -s histappend

export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=
export HISTSIZE=
export HISTFILE="$HOME/.bash_history_eternal"

PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# http://briancarper.net/blog/248.html
# https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
