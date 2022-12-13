#!/usr/bin/env bash
#
# Edit /etc/default/keyboard and change XKBOPTIONS to swap caps and escape.
#

FILE="/etc/default/keyboard"
SEARCH="XKBOPTIONS=+.*"
REPLACE="XKBOPTIONS=caps:swapescape"

echo $0:edit ${FILE}
sudo sed -ri "s/${SEARCH}/${REPLACE}/g" "${FILE}"

echo $0:done.
exit 0
