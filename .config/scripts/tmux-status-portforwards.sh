#!/bin/bash

ports=$(
	ps -axo command= | grep -E '(kubectl|hubble) .*port-forward' | grep -v grep |
		sed 's/.*port-forward//' | grep -oE ' [0-9]+(:[0-9]+)?( |$)' | cut -d: -f1
	pids=$(pgrep -x k9s | paste -sd, -)
	[[ -n $pids ]] && lsof -nP -iTCP -sTCP:LISTEN -a -p "$pids" 2>/dev/null |
		grep -oE ':[0-9]+ \(LISTEN\)' | cut -d' ' -f1 | tr -d :
)
ports=$(sort -un <<<"$ports" | grep .)
[[ -n $ports ]] || exit 0

tmp=$(mktemp -d "${TMPDIR:-/tmp}/tmux-pf.XXXXXX")
trap 'rm -rf "$tmp"' EXIT
for p in $ports; do
	(
		if curl -so /dev/null -m 0.5 "http://127.0.0.1:$p/"; then
			printf '#[fg=#a6d189]●#[default]%s' "$p"
		else
			printf '#[fg=#e78284]●#[default]%s' "$p"
		fi >"$tmp/$p"
	) &
done
wait

out=()
for p in $ports; do out+=("$(<"$tmp/$p")"); done
printf '%s ' "${out[*]}"
