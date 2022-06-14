#!/usr/bin/env bash
read -p 'Enter version of solana software, which you want to install: ' version
solana-install init v$version
systemctl stop solana
rm -rf solana/ledger
mkdir solana/ledger 
sudo apt-get update
sudo apt-get install python3-venv git -y
git clone https://github.com/c29r3/solana-snapshot-finder.git
cd solana-snapshot-finder
python3 -m venv venv
source ./venv/bin/activate
pip3 install -r requirements.txt
python3 snapshot-finder.py --snapshot_path $HOME/solana/ledger -r http://api.testnet.solana.com
cd
rm -rf solana-snapshot-finder
systemctl restart solana
