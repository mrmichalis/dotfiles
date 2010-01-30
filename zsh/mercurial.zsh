#!/usr/bin/env zsh

alias mq='hg -R $(hg root)/.hg/patches'
alias tmd="hg tmd -X '**fixtures**' | mate"
alias hgt='hg log -vd "`date -j \"+%Y-%m-%d\"`" -u steve | grep "{t:"'

function pull_everything() {
    for repo in $( ls -1 ); do
        if [[ -d $repo && -d $repo/.hg ]]; then
            echo "Pulling" $repo
            hg -R $repo pull -u
            echo
        fi
    done
}

function_bitb() {
    local P="$(hg paths 2>/dev/null | grep 'bitbucket.org' | head -1)"
    local URL="$(echo $P | sed -e's|.*\(bitbucket.org.*\)|http://\1|')"
    [[ -n $URL ]] && open $URL || echo "No BitBucket path found!"
}
