#!/bin/bash

if command -v podman &> /dev/null; then
    echo "podman"
elif command -v docker &> /dev/null; then
    echo "docker"
else
    echo "no-runtime"
fi