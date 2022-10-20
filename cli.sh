#!/usr/bin/env bash
sudo apt-get install libudev-dev pkg-config libssl-dev build-essential -y
curl https://sh.rustup.rs -sSf | sh
source "$HOME/.cargo/env"
cargo install solana-foundation-delegation-program-cli
sh -c "$(curl -sSfL https://release.solana.com/v1.14.5/install)"
