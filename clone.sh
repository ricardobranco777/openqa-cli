#!/bin/bash

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <git_repo> <branch> <parent_id> [extra arguments...]"
  echo "Missing arguments:"
  echo "  <git_repo>   : Git repository URL"
  echo "  <branch>     : Git branch"
  echo "  <job>        : Job URL"
  echo "  [extra arguments]: Any number of additional arguments"
  exit 1
fi

repo="$1"
[[ ! $repo =~ \.git$ ]] && repo="${repo}.git"

# Strip everything after '#' in https://openqa.suse.de/tests/11549040#settings
url="${3%%#*}"
# Get host with scheme stripping everything after "/t"
host="${url%%/t*}"
# Bash's basename
job="${url##*/}"

source="$host"
dest="$host"

./run_clone_job.sh "$source" "$dest" "$job" "$repo" "$2" "${@:4}"
