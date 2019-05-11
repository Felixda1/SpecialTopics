#!/usr/bin/env bash
pflag=
dflag=
dval=/tmp/gitlab-data
pval=8081
COMM=


while getopts hp:d: name
do
    case $name in
    p)    pflag=1
          pval="$OPTARG";;
    d)    dflag=1
          dval="$OPTARG";;
    h)   printf "Usage: %s: [-p port] [-d directory] args\n" $0
          exit 0;;
    esac
done

shift $(($OPTIND - 1))

COMM="$1"

if [ "$COMM" = "start" ]; then
    COMM="up -d"
elif [ "$COMM" = "stop" ]; then
    COMM="stop"
elif [ "$COMM" = "destroy" ]; then
    COMM="rm"
fi



export pval
export dval

docker-compose $COMM