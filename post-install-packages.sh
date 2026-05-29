#! /usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Using linux, will install packages, debian style"
    "${script_dir}/post-install-packages-ubuntu.sh"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Using macos, will install packages with brew"
    "${script_dir}/post-install-packages-macos.sh"
fi
