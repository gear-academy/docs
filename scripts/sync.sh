#!/bin/sh

REPOS="\
concert \
crowdsale \
dao \
dao-light \
dex \
escrow \
fungible-token \
game-of-chance \
gear-lib \
identity \
multisig-wallet \
multitoken \
non-fungible-token \
on-chain-nft \
sharded-fungible-token \
staking \
"

WORKSPACES="\
dex \
gear-lib \
non-fungible-token \
sharded-fungible-token \
"

set -e
cd "$(dirname "$0")/.."
mkdir -p dapps
cd dapps

for REPO in $REPOS
do
    if [ ! -d $REPO ]; then
        git clone https://github.com/gear-dapps/$REPO.git
    else
        cd $REPO
        git reset --hard
        git pull
        cd ..
    fi
done

for WORKSPACE in $WORKSPACES
do
    rm -f "$WORKSPACE/Cargo.toml"
done

find . -name build.rs -type f -exec rm -v {} \;
find . -name Cargo.lock -type f -exec rm -v {} \;
