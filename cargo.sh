curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env

cargo install onetun

curl -fsSL git.io/wgcf.sh | sudo bash

wgcf register

wgcf generate
