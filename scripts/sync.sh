#!/bin/sh

REPOS="\
compound \
concert \
crowdsale-ico \
dao \
dao-light \
dex \
dutch-auction \
escrow \
feeds \
fomo3D \
fungible-token \
gear-lib \
identity \
lottery \
multisig-wallet \
multitoken \
nft-pixelboard \
non-fungible-token \
ping \
RMRK \
rock-paper-scissors \
staking \
supply-chain \
swap \
"

WORKSPACES="\
dex \
feeds \
gear-lib \
non-fungible-token \
RMRK \
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
