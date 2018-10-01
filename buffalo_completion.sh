#/usr/bin/env bash

_buffalo_complete()
{
  local cur prev

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  if [ $COMP_CWORD -eq 1 ]; then
    COMPREPLY=( $(compgen -W "build db destroy dev fix generate help info new pop routes setup task test version" -- $cur) )
  elif [ $COMP_CWORD -eq 2 ]; then
    case "$prev" in
      -*)
        COMPREPLY=( $(compgen -W "h -help" -- $cur) )
        ;;
      "pop"|"db")
        COMPREPLY=( $(compgen -W "create destroy drop fix generate migrate reset schema version" -- $cur) )
        ;;
      "destroy")
        COMPREPLY=( $(compgen -W "action mailer model resource" -- $cur) )
        ;;
      "generate")
        COMPREPLY=( $(compgen -W "action docker mailer resource swagger task" -- $cur) )
        ;;
      "help")
        COMPREPLY=( $(compgen -W "build db destroy dev fix generate help info new pop routes setup task test version" -- $cur) )
        ;;
      *)
        ;;
    esac
  fi

  return 0
} &&
complete -F _buffalo_complete buffalo
