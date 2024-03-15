#!/usr/bin/env bash
set -x
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)

cd $SCRIPT_DIR

tag=$(cat $SCRIPT_DIR/repo.tag)
export port=18081
export containerName=aiops-metisweb
export container=aiops-metisweb

cCount=$(docker ps -a|grep $containerName|wc -l)
if [ $cCount -gt 0 ] ; then
  echo "will stop existing container $containerName"
  docker ps -a|grep $containerName|awk -F" " '{print $1}'| xargs docker rm -f
fi

docker run \
 -d \
 -p ${port}:80 --network levin-aiops-network \
 --hostname $container \
 -e testing=NO \
 --name $container \
 -d  $tag
