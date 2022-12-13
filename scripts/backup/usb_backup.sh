#!/usr/bin/env bash
#
# Backup list from $HOME to usb
#

VOLUME="thx-backup"
LIST="targets.conf"

SOURCE="${HOME}"
DESTINATION="/media/${USER}/${VOLUME}/${USER}"

OPTIONS=(
  --archive                 # archive mode is -rlptgoD (no -A,-X,-U,-N,-H)
  --delete-during           # receiver deletes during the transfer
# --dry-run                 # perform a trial run with no changes made
  --files-from="${LIST}"    # read list of source-file names from FILE
# --log-file="${LOG}"       # log what we're doing to the specified FILE
# --progress                # show progress during transfer
  --recursive               # recurse into directories
  --stats                   # give some file-transfer stats
  --verbose                 # increase verbosity
)

echo $0: backup ${SOURCE} to ${DESTINATION}
sudo rsync "${OPTIONS[@]}" "${SOURCE}" "${DESTINATION}"

echo $0: done.
exit 0

# FOLDERPATH='/home/thibault/workspaces/'
# HOST='192.168.1.100'
# USER='thibault'
# 
# echo "rsync -av --del --stats ${USER}@${HOST}:${FOLDERPATH} ${FOLDERPATH}"
# rsync -av --del --stats ${USER}@${HOST}:${FOLDERPATH} ${FOLDERPATH}
# 
# --archive, -a            archive mode is -rlptgoD (no -A,-X,-U,-N,-H)
# --recursive, -r          recurse into directories
# --links, -l              copy symlinks as symlinks
# --perms, -p              preserve permissions
# --times, -t              preserve modification times
# --group, -g              preserve group
# --owner, -o              preserve owner (super-user only)
# -D                       same as --devices --specials
# --devices                preserve device files (super-user only)
# --specials               preserve special files
