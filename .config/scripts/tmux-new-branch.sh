#!/bin/bash

key=$(tmux show -sv @task 2>/dev/null)
if [[ -z $key ]]; then
	echo "No task selected. Pick one with prefix+j first."
	exit 1
fi

if ! git rev-parse --git-dir >/dev/null 2>&1; then
	echo "Not a git repository: $PWD"
	exit 1
fi

slug=$(tmux show -sv @task_slug 2>/dev/null)
branch=$key${slug:+-$slug}

if git show-ref --quiet --verify "refs/heads/$branch"; then
	git switch "$branch" || exit 1
else
	git fetch --quiet origin || exit 1
	base=$(git symbolic-ref --quiet --short refs/remotes/origin/HEAD)
	if [[ -z $base ]]; then
		git remote set-head origin --auto >/dev/null || exit 1
		base=$(git symbolic-ref --quiet --short refs/remotes/origin/HEAD)
	fi
	git switch -c "$branch" --no-track "$base" || exit 1
fi

tmux refresh-client -S
