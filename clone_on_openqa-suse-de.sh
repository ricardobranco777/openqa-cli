#!/bin/bash

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <git_repo> <branch> <parent_id> [extra arguments...]"
  echo "Missing arguments:"
  echo "  <git_repo>   : Git repository URL"
  echo "  <branch>     : Git branch"
  echo "  <parent_id>  : Parent ID"
  echo "  [extra arguments]: Any number of additional arguments"
  exit 1
fi

source="http://openqa.suse.de"
dest="http://openqa.suse.de"

./run_clone_job.sh "$source" "$dest" "$3" "$1" "$2" "${@:4}"
