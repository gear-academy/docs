#!/bin/sh

REPOS="\
concert \
dao \
dao-light \
dutch-auction \
escrow \
feeds \
fungible-token \
gear-lib \
lottery \
multitoken \
non-fungible-token \
ping \
"

set -e
cd "$(dirname "$0")/.."

for REPO in $REPOS
do
    if [ ! -d $REPO ]; then
        git clone https://github.com/gear-academy/$REPO.git
    else
        cd $REPO
        git reset --hard
        git pull
        cd ..
    fi
done

rm feeds/Cargo.toml
rm non-fungible-token/Cargo.toml
