# Containarized OpenQA CLI

This repository contains scripts for cloning jobs in OpenQA.

## Prerequisites

- podman
- client.conf

### client.conf

Create a file with your credentials.
Is Recomended to have this file on you home and create a link here with the name client.conf

```
[openqa.opensuse.org]
key = <YOUR_KEY>
secret = <YOUR_SECRET>

[openqa.suse.de]
key = <YOUR_KEY>
secret = <YOUR_SECRET>
```

## How to build the container

To build the container, run the following command:

```
make build
```

## How to use the scripts

### run_clone_job

This script clones a job in OpenQA. It requires the following arguments:

```
Usage: ./run_clone_job.sh <source> <dest> <parent_id> <git_repo> <branch> [extra arguments...]
```

- `source`: Source host
- `dest`: Destination host
- `parent_id`: Parent ID
- `git_repo`: Git repository URL
- `branch`: Git branch
- `extra arguments`: Any number of additional arguments

### clone_on_openqa-suse-de

This script clones a job in OpenQA on openqa.suse.de. It requires the following arguments:

```
Usage: ./clone_on_openqa-suse-de.sh <git_repo> <branch> <parent_id> [extra arguments...]
```

- `git_repo`: Git repository URL
- `branch`: Git branch
- `parent_id`: Parent ID
- `extra arguments`: Any number of additional arguments

### clone_on_openqa-opensuse-org

This script clones a job in OpenQA on openqa.opensuse.org. It requires the following arguments:

```
Usage: ./clone_on_openqa-opensuse-org.sh <git_repo> <branch> <parent_id> [extra arguments...]
```

- `git_repo`: Git repository URL
- `branch`: Git branch
- `parent_id`: Parent ID
- `extra arguments`: Any number of additional arguments

### clone_bci_on_openqa-suse-de

This script clones a BCI job in OpenQA on openqa.suse.de. It requires the following arguments:

```
Usage: ./clone_bci_on_openqa-suse-de.sh <parent_id> <BCI_TESTS_REPO> <BCI_TESTS_BRANCH>
```

- `parent_id`: Parent ID
- `BCI_TESTS_REPO`: Git repository URL for BCI tests
- `BCI_TESTS_BRANCH`: Git branch for BCI tests
