#!/bin/sh
set -eu

new=$(mktemp)
find /usr/share/info -name '*.info*' | while OFS= read -r f; do
	install-info "$f" "$new"
done
mv "$new" /usr/share/info/dir
