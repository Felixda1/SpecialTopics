pflag=
dflag=
dval=/tmp/gitlab-data
pval=8081
comm=


while getopts hpd: name
do
    case $name in
    p)    pflag=1
          pval="$POPTARG";;
    d)    dflag=1
          dval="$DOPTARG";;
    h)   printf "Usage: %s: [-p port] [-d directory] args\n" $0
          exit 0;;
    esac
done

if [ ! -z "$pflag" ]; then
    printf 'Option -p specified\n' "$pval"
fi
if [ ! -z "$dflag" ]; then
    printf 'Option -d specified\n' "$dval"
fi
shift $(($OPTIND - 1))

comm = "$1"

if [ "$comm" = "start" ]; then
    comm = "up"
elif [ "$comm" = "stop" ]; then
    comm = "stop"
elif [ "$comm" = "destory" ]; then
    comm = "rm"
fi



export pval
export dval

docker-compose "$comm"