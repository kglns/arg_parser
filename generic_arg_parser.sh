#!/bin/bash

# Generic arg parser which can pick up both flag and positional args

PARAMS=""

while (("$#")); do
	case "$1" in
		-f|--flag)
			FARG=$2
			shift 2
			;;
		--)
			shift
			break
			;;
		-*|--*=)
			echo "Error: Unsupported flag $1" >&2
			exit 1
			;;
		*)
			PARAMS="$PARAMS $1"
			shift
			;;
	esac
done

eval set -- "$PARAMS"

# Test
echo "$FARG"
echo "$PARAMS"
