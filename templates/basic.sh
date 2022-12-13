#!/usr/bin/env bash

#-------------------------------------------------------------------------------
#===============================================================================
# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace



# Commandline options. This defines the usage page, and is used to parse cli
# opts & defaults from. The parsing is unforgiving so be precise in your syntax
# - A short option must be preset for every long option; but every short option
#   need not have a long option
# - `--` is respected as the separator between options and arguments
# - We do not bash-expand defaults, so setting '~/app' as a default will not resolve to ${HOME}.
#   you can use bash variables to work around this (so use ${HOME} instead)

# shellcheck disable=SC2034
read -r -d '' __usage <<-'EOF' || true # exits non-zero when EOF encountered
  -f --file  [arg] Filename to process. Required.
  -t --temp  [arg] Location of tempfile. Default="/tmp/bar"
  -v               Enable verbose mode, print script as it is executed
  -d --debug       Enables debug mode
  -h --help        This page
  -n --no-color    Disable color output
  -1 --one         Do just one thing
EOF

# shellcheck disable=SC2034
read -r -d '' __helptext <<-'EOF' || true # exits non-zero when EOF encountered
This is Bash3 Boilerplate's help text. Feel free to add any description of your
program or elaborate more on command-line arguments. This section is not
parsed and will be added as-is to the help.
EOF

printf "%s\n" "${__helptext}"
printf "%s\n" "${__usage}"

exit 0

