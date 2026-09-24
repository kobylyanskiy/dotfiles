#!/bin/bash

key=$1
branch=$(git -C "$2" rev-parse --abbrev-ref HEAD 2>/dev/null)
[[ -z $key && $branch =~ [A-Z][A-Z0-9]+-[0-9]+ ]] && key=${BASH_REMATCH[0]}

rest=$branch
if [[ $key && $branch == "$key"* ]]; then
	rest=${branch#"$key"}
	rest=${rest#-}
fi

if [[ $key ]]; then
	prefix=""
	[[ $branch && -z $rest ]] && prefix=" "
	printf '#[range=user|%s fg=#ca9ee6]%s%s#[norange default] ' "$key" "$prefix" "$key"
fi
[[ $rest ]] && printf '#[fg=#a6d189] %s#[default] ' "$rest"
