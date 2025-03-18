#!/bin/bash -e

exec podman run --rm -it -v $HOME/client.conf:/etc/openqa/client.conf:ro,z ghcr.io/ricardobranco777/openqa-cli "$@"
