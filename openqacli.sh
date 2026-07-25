#!/bin/bash -e

exec sudo podman run --rm -it -v $HOME/client.conf:/etc/openqa/client.conf:ro,z ghcr.io/ricardobranco777/openqa-cli "$@"
