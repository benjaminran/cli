#!/usr/bin/env bash

#
# Usage: prepare.sh cli-name
#

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sed -i '' "s/name=cli/name=$1/"
for f in "${dir}"/lib/cli-*; do
    mv "$f" "$(dirname "$f")/$(basename "$f" | sed 's/cli\(.*\)/${1}\1/)"
done
for f in "${dir}"
