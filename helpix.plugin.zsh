# Config 
: ${HELPIX_ENABLED:=1}
: ${HELPIX_VIEWER:="bat"}
: ${HELPIX_STYLE:="--language=help --style=plain --color=always"}

_helpix_viewer_args() {
  local -a args=()
  case "$HELPIX_VIEWER" in
    "bat"|"batcat")
       args=("${(@z)HELPIX_STYLE}")
      ;;
    *)
      args=()
      ;;
  esac

  print -r -- "${args[@]}"
}

_helpix_check_help() {
  local word

  # check only real arguments
  for word in "$@"; do
    [[ "$word" == "-h" || "$word" == "--help" ]] && return 0
  done

  return 1
}

_helpix() {

  # suggested by AI, it restores normal Zsh behavior
  emulate -L zsh  

  local -a words
  words=("${(z)BUFFER}")

  local -a alias_words
  alias_words=("${(z)aliases[${words[1]}]}")

  if [[ -n $alias_words ]]; then
    words[1]=$alias_words
  fi

  words=(
    "${alias_words[@]}"
    "${words[@]:1}"
)

  if (( HELPIX_ENABLED )) && _helpix_check_help "${words[@]}"; then
    zle kill-whole-line
    "${words[@]}" 2>&1 | "$HELPIX_VIEWER" $(_helpix_viewer_args)

    # zle redisplay
    return
  fi

  zle .accept-line
}

# Plugin initialization
zle -N accept-line _helpix