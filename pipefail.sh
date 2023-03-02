#!/bin/bash
set -eo pipefail

date | grep 2018
echo "${PIPESTATUS[0]} ${PIPESTATUS[1]}"
false | true
echo "${PIPESTATUS[0]} ${PIPESTATUS[1]}"


