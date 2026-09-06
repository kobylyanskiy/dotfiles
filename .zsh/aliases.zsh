alias k=kubectl
alias v=nvim
alias d=docker
alias dc=docker-compose
alias vim=nvim
alias lzd=lazydocker
alias tf=terraform
alias ls='eza'
alias vimdiff='nvim -d'
alias kdebug='kubectl run debug-$USER -n monitoring --rm -it --image=nicolaka/netshoot --overrides="$(cat ~/.zsh/netshoot-overrides.json)"'
alias relogin='KUBECONFIG="fakefile" tsh logout && tsh --proxy=teleport.internal.corp.traderepublic.com:443 --auth okta login'
alias review='tuicr -r "$(git merge-base origin/master HEAD)..HEAD"'

# namespace, pod-name
kpodzone() {
	local ns=$1 filter=${2:-.}
	local zones=$(kubectl get nodes -o jsonpath='{range .items[*]}{.metadata.name}{" "}{.metadata.labels.topology\.kubernetes\.io/zone}{"\n"}{end}')
	kubectl get po -n "$ns" -o jsonpath='{range .items[*]}{.metadata.name}{" "}{.spec.nodeName}{"\n"}{end}' |
		grep "$filter" |
		while read pod node; do
			echo "$pod $(echo "$zones" | awk -v n="$node" '$1==n{print $2}')"
		done | column -t
}

jmine() { acli jira workitem search --jql "assignee = currentUser() AND statusCategory != Done ORDER BY updated DESC"; }
jrel() {
	local key="${1:?usage: jrel PTECH-1234}"
	local chain=("Backlog" "To Do" "In Progress" "In Review" "Ready for QA" "QA Passed" "Ready for Release")

	local start
	start=$(acli jira workitem search --jql "key = $key" --fields status --json |
		jq -r '.[0].fields.status.name') || return 1

	echo "current: $start"

	if [[ "$start" == "${chain[-1]}" ]]; then
		echo "already at ${chain[-1]}"
		return 0
	fi

	if [[ " ${chain[*]} " != *" $start "* ]]; then
		echo "→ In Progress  (out of $start)"
		acli jira workitem transition --key "$key" --status "In Progress" || return 1
		start="In Progress"
	fi

	local seen=0 s
	for s in "${chain[@]}"; do
		if ((!seen)); then
			[[ "$s" == "$start" ]] && seen=1
			continue
		fi
		acli jira workitem transition --key "$key" --status "$s" || {
			echo "stuck at $s"
			return 1
		}
	done
}

l1story() {
	local sprint key
	sprint=$(acli jira board list-sprints --id "6498" --state active --json |
		jq -r '.sprints[0].id // empty')
	if [[ -z $sprint ]]; then
		print -u2 "l1story: no active sprint on board 6498"
		return 1
	fi
	key=$(acli jira sprint list-workitems --board "6498" --sprint "$sprint" \
		--jql 'summary ~ "L1 First Responder" ORDER BY created DESC' \
		--fields key --json | jq -r '.issues[0].key // empty')
	if [[ -z $key ]]; then
		print -u2 "l1story: no L1 story in sprint $sprint"
		return 1
	fi
	print -- "$key"
}

l1task() {
    local dir=$HOME/.config/l1task tmpd parent
    parent=$(l1story) || return 1
    print -u2 "parent: $parent"

    tmpd=$(mktemp -d -t l1task) || return 1
    cp "$dir/template.md" "$tmpd/task.md" || { rm -rf "$tmpd"; return 1 }
    ${EDITOR:-vi} "$tmpd/task.md"

    jq -Rs --arg parent "$parent" -f "$dir/adf.jq" "$tmpd/task.md" >"$tmpd/task.json"
    acli jira workitem create --from-json "$tmpd/task.json"
    rm -rf "$tmpd"
}
