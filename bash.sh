#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
$(./runtime.sh) run -ti --rm openqa-cli bash
