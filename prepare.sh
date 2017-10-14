#!/usr/bin/env bash

#
# Usage: prepare.sh cli-name
#

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# name bar
sed "s/name=cli/name=$1/" "${dir}/lib/cli" > /tmp/cli-prepared
rm lib/cli && mv /tmp/cli-prepared "${dir}/lib/$1" && chmod +x "${dir}/lib/$1"

# bin link
rm bin/cli && (cd bin && ln -s "../lib/$1" "$1")

# rename lib scripts
for f in "${dir}"/lib/cli*; do
    mv "$f" "$(dirname "$f")/$(basename "$f" | sed "s/cli\(.*\)/${1}\1/")"
done

echo Done
