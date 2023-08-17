#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <parent_id> <BCI_TESTS_REPO> <BCI_TESTS_BRANCH>"
  echo "Missing arguments:"
  echo "  <parent_id>         : Parent ID"
  echo "  <BCI_TESTS_REPO>    : Git repository URL for BCI tests"
  echo "  <BCI_TESTS_BRANCH>  : Git branch for BCI tests"
  exit 1
fi

source="http://openqa.suse.de"
dest="http://openqa.suse.de"

parent_id="$1"
bci_tests_repo="$2"
bci_tests_branch="$3"

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

./run_clone_job.sh "$source" "$dest" "$parent_id" "" BCI_TESTS_REPO="$bci_tests_repo" BCI_TESTS_BRANCH="$bci_tests_branch"
