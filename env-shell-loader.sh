#!/bin/bash

# Override builtin cd to allow for loading env vars
function cd {
  file=".env"

  if [ -f "$file" ]; then
    delete_env_file $file
  fi

  builtin cd "$@"

  if [ -f "$file" ]; then
    load_env_file $file
  fi
}

function load_env_file {
  file="$1"

  while IFS= read -r line
  do
    export $line
  done <"$file"
}

function delete_env_file {
  file="$1"

  while IFS= read -r line
  do
    key=`cut -d'=' -f1 <<< $line`
    unset $key
  done <"$file"
}
