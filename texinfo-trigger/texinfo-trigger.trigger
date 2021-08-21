#!/bin/sh

index=/usr/share/info/index
dirfile=/usr/share/info/dir

new=$(mktemp)
trap 'rm -f "$new"' 0
find /usr/share/info -name '*.info*' | sort > "$new"
[ -f "$index" ] || touch "$index"

# install new info files
comm -1 -3 "$index" "$new" | while OFS= read -r f; do
	install-info "$f" "$dirfile"
done

# delete entries from removed info files
comm -2 -3 "$index" "$new" | while OFS= read -r f; do
	install-info --delete "$f" "$dirfile"
done

mv "$new" "$index"
chmod 644 "$index"
