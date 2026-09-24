#!/bin/bash

if tsh --version &>/dev/null; then

	now=$(date +%s)
	cache=${TMPDIR:-/tmp}/tmux-tsh-status

	if [[ ! -f $cache || $(($(date -r "$cache" +%s) + 60)) -lt $now ]]; then
		tsh status 2>/dev/null | grep -m1 'Valid until' >"$cache"
	fi

	read -r _ _ d t z _ <"$cache"
	exp=$(date -j -f "%Y-%m-%d %H:%M:%S %z" "$d $t $z" +%s 2>/dev/null)
	left=$((${exp:-0} - now))

	((left <= 0)) && printf '#[fg=#e78284]🔒 tsh expired · C-a t#[default] '

fi
