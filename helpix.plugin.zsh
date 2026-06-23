# Config 
: ${HELPIX_ENABLED:=1}
: ${HELPIX_VIEWER:="bat"}
: ${HELPIX_STYLE:="--language=help --style=plain --color=always"}

# computed viewer arguments once (during initialization)
HELPIX_VIEWER_ARGS=()

_helpix_init() {
  case "$HELPIX_VIEWER" in
    "bat"|"batcat")
      HELPIX_VIEWER_ARGS=("${(@z)HELPIX_STYLE}")
      ;;
  esac
}

_helpix_check_help() {
  local word

  # check only real arguments
  for word; do
    case "$word" in
      "-h"|"--help"|"help")
        return 0
        ;;
    esac
  done

  return 1
}

# main widget
_helpix() {

  # prevents global side effects, sugguested by AI
  emulate -L zsh  

  local cmd="$BUFFER"
  # skip if piped or redirected
  if [[ "$cmd" == *"|"* || "$cmd" == *">"* ]]; then
    zle .accept-line
    return
  fi

  local -a words  

  words=("${(z)cmd}")

  if (( ${#words} )) && [[ -n ${aliases[${words[1]}]-} ]]; then
    local -a alias_words
    alias_words=("${(z)aliases[${words[1]}]}")
    words=("${alias_words[@]}" "${words[@]:1}")
  fi

  if (( HELPIX_ENABLED )) && _helpix_check_help "${words[@]}"; then
    zle kill-whole-line
    "${words[@]}" 2>&1 | "$HELPIX_VIEWER" "${HELPIX_VIEWER_ARGS[@]}"
    # zle redisplay
    return
  fi

  zle .accept-line
}

# Plugin initialization
_helpix_init
zle -N accept-line _helpix