#! /bin/bash

cd $(tmux run "echo #{pane_start_path}") || exit
url=$(git remote get-url origin)

if [[ $url == *github.com* ]]; then
	if [[ $url == git@* ]]; then
		url="${url#git@}"
		url="${url/://}"
		url="${url/.git/}"
		url="https://$url"
	fi
	open "$url" || echo "No remote found"
fi
