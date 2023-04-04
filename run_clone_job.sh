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
runtime=`./runtime.sh`

source=$1
dest=$2
parent_id=$3
git_repo=$4
branch=$5
shift 5
extra_args=("$@") 

# Remove url from parent_id
if ! [[ $parent_id =~ ^[0-9]+$ ]]; then
  parent_id=$(basename "$parent_id" | cut -d "#" -f1)
fi

# Extract the user from the git repository URL
user=$(echo "$git_repo" | awk -F'[:/]' '{print $(NF-1)}')

compose_command=($runtime run -ti --rm openqa-cli /usr/share/openqa/script/clone_job.pl)
compose_command+=(--host "$dest" --from "$source")
compose_command+=(--skip-chained-deps --skip-download)
compose_command+=("$parent_id")
compose_command+=(CASEDIR="$git_repo#$branch")
compose_command+=(TEST="${user}_${branch}")
compose_command+=(_GROUP=0)

for arg in "${extra_args[@]}"; do
  compose_command+=("$arg")
done

full_command=$(IFS=' ' && echo "${compose_command[*]}")
echo "Full command: $full_command"

"${compose_command[@]}"

