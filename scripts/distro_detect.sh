#!/usr/bin/env bash
#
# Detect linux distribution.
#

UNAME=$(uname | tr "[:upper:]" "[:lower:]")

[[ "${UNAME}" == "linux" ]] && \
	 echo "$0:error:not linux" && exit 1;

DISTRO="$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr '[:upper:]' '[:lower:]')"

echo ${DISTRO};
exit 0
