#!/bin/bash

# Override builtin cd to allow for loading env vars
function cd {
  file=".env"

  old_dir="$PWD"

  builtin cd "$@"

  new_dir="$PWD"
  dir_diff="${old_dir//"$new_dir"}" # will be a stub if parent directory

  # only remove env vars if moving into a parent directory
  if [[ -f "$old_dir/$file" && "$dir_diff" != "$old_dir" ]]; then
    delete_env_file $old_dir/$file
  fi

  if [ -f "$new_dir/$file" ]; then
    load_env_file $new_dir/$file
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
