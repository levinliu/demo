#!/usr/bin/env bash
set -x
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)

cd $SCRIPT_DIR
dockerFile=./Dockerfile

tag=$(cat $SCRIPT_DIR/repo.tag)

containerName=metis-svr
#show build verbose log
docker build --progress=plain -f $dockerFile -t $tag .
if [ "$?" -ne 0 ] ; then
  echo "fail to build image, stop here"
  exit -1
fi
echo "built ${dockerFile} as image ${tag}"
echo  "complete build"

cCount=$(docker ps -a|grep $containerName|wc -l)
if [ $cCount -gt 0 ] ; then
  echo "will stop existing container $containerName"
  docker ps -a|grep $containerName|awk -F" " '{print $1}'| xargs docker rm -f
fi

port=8080
startCmd="docker run -p $port:8080   -v /data/metis/model/:/metis/time_series_detector/model:Z   --name $containerName -d $tag"
echo "run it:"
echo  "$startCmd"
eval $startCmd
sleep 5
curl localhost:$port
execCmd="docker exec -it  $containerName  bash"
echo  "$execCmd"
echo "start health check"
eval $execCmd