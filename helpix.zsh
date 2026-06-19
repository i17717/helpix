helpix () {
  local cmd="$BUFFER"
  local -a words
  words=("${(z)cmd}")
  local is_help=false

  # check only real arguments
  for word in "${words[@]}"; do
    if [[ "$word" == "-h" || "$word" == "--help" ]]; then
      is_help=true
      break
    fi
  done

  if $is_help; then
    zle kill-whole-line
    # Run command in a subshell
    zsh -c "{ $cmd } 2>&1 | bat --language=help --color=always --style=plain"
  
    zle reset-prompt
    return
  fi

  zle .accept-line
}
zle -N accept-line helpix