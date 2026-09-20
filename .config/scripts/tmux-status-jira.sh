#!/bin/bash

key=$1
if [[ -z $key && -n $2 ]]; then
	branch=$(git -C "$2" rev-parse --abbrev-ref HEAD 2>/dev/null)
	[[ $branch =~ [A-Z][A-Z0-9]+-[0-9]+ ]] && key=${BASH_REMATCH[0]}
fi
[[ -n $key ]] || exit 0

printf '#[range=user|%s fg=#ca9ee6]%s#[norange default] ' "$key" "$key"
