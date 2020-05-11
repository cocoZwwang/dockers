PATH=/usr/bin:$PATH
exoort $PATH
echo "run====>$@"
exec "$@"
