#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <git_repo> <branch> <parent_id> [extra arguments...]"
  echo "Missing arguments:"
  echo "  <git_repo>   : Git repository URL"
  echo "  <branch>     : Git branch"
  echo "  <parent_id>  : Parent ID"
  echo "  [extra arguments]: Any number of additional arguments"
  exit 1
fi

source="https://openqa.opensuse.org"
dest="https://openqa.opensuse.org"

./run_clone_job.sh "$source" "$dest" "$3" "$1" "$2" "${@:4}"

