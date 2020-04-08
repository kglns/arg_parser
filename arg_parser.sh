#!/bin/bash
# set -x
usage()
{
  echo "Usage: $0 [-o|-t] [ -w WORD ]"
  exit 2
}

set_variable()
{
  local varname=$1
  shift
  if [ -z "${!varname}" ]; then
    eval "$varname=\"$@\""
  else
    echo "Error: $varname already set"
    usage
  fi
}

#########################
# Perform tasks

run()
{
	echo "$1"
}

#########################
# Main script starts here

unset ACTION WORD

# The arg followed by ":" expects $OPTARG
while getopts 'otw:?h' c
do
  case $c in
    o) set_variable ACTION ONCE ;;
    t) set_variable ACTION TWICE ;;
    w) set_variable WORD $OPTARG ;;
    h|?) usage ;; 
  esac
done

[ -z "$ACTION" ] && usage
[ -z "$WORD" ] && usage

if [ -n "$WORD" ]; then
  case $ACTION in
    ONCE) run $WORD ;;
    TWICE) run $WORD ; run $WORD ;;
  esac
fi