#!/usr/bin/env bash
# ----------------------------------------------------------
# Author:          damiancypcar
# Modified:        10.03.2023
# Version:         1.1
# Desc:            Generate a pseudo UUID
# ----------------------------------------------------------

set -euo pipefail

uuid()
{
	local N B C='89ab'

	for (( N=0; N < 16; ++N ))
	do
		B=$(( $RANDOM%256 ))

		case $N in
			6)
				printf '4%x' $(( B%16 ))
				;;
			8)
				printf '%c%x' ${C:$RANDOM%${#C}:1} $(( B%16 ))
				;;
			3 | 5 | 7 | 9)
				printf '%02x-' $B
				;;
			*)
				printf '%02x' $B
				;;
		esac
	done

	echo
}

if [ "$BASH_SOURCE" == "$0" ]
then
	uuid
fi
