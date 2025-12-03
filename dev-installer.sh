#!/bin/bash
set -e

sudo apt install -y curl wget git make jq htop vim

snaps=(
code
sublime-text
android-studio
flutter
pycharm-professional
webstorm
goland
clion
postman
docker
lxd
discord
)

exec 3>"/tmp/printlock"

print() {
    flock 3
    echo "$1"
    flock -u 3
}

install_snap() {
    s="$1"
    for i in {1..3}; do
        if [[ "$s" == "code" || "$s" == "sublime-text" || \
              "$s" == "android-studio" || "$s" == "flutter" || \
              "$s" == "pycharm-professional" || "$s" == "webstorm" || \
              "$s" == "goland" || "$s" == "clion" ]]; then
            sudo snap install "$s" --classic && return 0
        else
            sudo snap install "$s" && return 0
        fi
        sleep 2
    done
    return 1
}

max_parallel=4
running=0

for s in "${snaps[@]}"; do
    print "[start] $s"
    (
        if install_snap "$s"; then
            print "[ ok ] $s"
        else
            print "[fail] $s"
        fi
    ) &
    running=$((running+1))

    if [[ $running -ge $max_parallel ]]; then
        wait -n
        running=$((running-1))
    fi
done

while [[ $running -gt 0 ]]; do
    wait -n
    running=$((running-1))
done

print "done"

