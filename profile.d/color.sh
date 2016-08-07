
function colored(){
  case $# in
    3) echo -en "\033[$2\033[$3$1\033[0m";;
    2) echo -en "\033[$2$1\033[0m";;
    1) echo -en "$1";;
    *) echo -en "";;
  esac
}

function colors(){
  local T
  T="test"
  echo -e "\n             40m   41m   42m   43m   44m   45m   46m   47m";
  for FG in \
    '    m' \
    '   1m' \
    '  30m' \
    '1;30m' \
    '  31m' \
    '1;31m' \
    '  32m' \
    '1;32m' \
    '  33m' \
    '1;33m' \
    '  34m' \
    '1;34m' \
    '  35m' \
    '1;35m' \
    '  36m' \
    '1;36m' \
    '  37m' \
    '1;37m'; do

    echo -ne "$FG"
    colored " $T " $FG
    FG=${FG// /}
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
      colored " $T " $FG $BG
    done
    echo ""
  done
  echo ""
}
