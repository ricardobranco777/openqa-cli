#!/bin/bash
set -e

if [ "$#" -lt 5 ]; then
  echo "Usage: $0 <source> <dest> <parent_id> <git_repo> <branch> [extra arguments...]"
  echo "Missing arguments:"
  echo "  <source>         : Source host"
  echo "  <dest>           : Destination host"
  echo "  <parent_id>      : Parent ID"
  echo "  <git_repo>       : Git repository URL"
  echo "  <branch>         : Git branch"
  echo "  [extra arguments]: Any number of additional arguments"
  exit 1
fi

make build &>/dev/null
runtime=$(./runtime.sh)

compose_command=("$runtime" run -ti --rm openqa-cli /usr/share/openqa/script/clone_job.pl)

if [[ $1 =~ ^- ]] ; then
  exec "${compose_command[@]}" "$@"
fi

source="$1"
dest="$2"
parent_id="$3"
git_repo="$4"
branch="$5"
shift 5

extra_opts=()
for opt; do
  [[ $opt =~ ^- ]] && extra_opts+=("$opt")
done

[[ ! $git_repo =~ \.git$ ]] && git_repo="${git_repo}.git"

# Remove url from parent_id
if ! [[ $parent_id =~ ^[0-9]+$ ]]; then
  parent_id="${parent_id%%#*}" # Strip everything after '#' in https://openqa.suse.de/tests/11549040#settings
  parent_id="${parent_id##*/}" # Bash's basename
fi

# Extract the user from the git repository URL
user=$(echo "$git_repo" | awk -F'[:/]' '{print $(NF-1)}')

compose_command+=(--host "$dest" --from "$source")
compose_command+=(--skip-chained-deps --skip-download)
for opt in "${extra_opts[@]}"; do
  compose_command+=("$opt")
done

compose_command+=("$parent_id")
compose_command+=(CASEDIR="$git_repo#$branch")
compose_command+=(TEST="${user}_${branch}")
compose_command+=(_GROUP=0)

for arg; do
  compose_command+=("$arg")
done

full_command=$(IFS=' ' && echo "${compose_command[*]}")
echo "Full command: $full_command"

exec "${compose_command[@]}"
