#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c
check "gcc" gcc -v
check "g++" g++ -v
check "greeting" [ $(cat /usr/local/etc/greeting.txt | grep hey) ]

# Report result
reportResults
