#!/usr/bin/env bash
#
# Script template.
#

echo $0: step 01
whoami

echo $0: step 02
pwd

[[ $(return 1) ]] \
    && echo $0: step 03 TRUE \
    || echo $0: step 03 FALSE

echo $0: done.
exit 0
