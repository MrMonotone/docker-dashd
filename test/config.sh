#!/bin/bash
set -e

testAlias+=(
	[zcoind:trusty]='zcoind'
)

imageTests+=(
	[zcoind]='
		rpcpassword
	'
)
