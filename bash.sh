#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
$(./runtime.sh) run -ti --rm openqa-cli bash
