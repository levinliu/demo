#!/usr/bin/env bash
set -x
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)

cd $SCRIPT_DIR

repo=$(cat $SCRIPT_DIR/repo.tag)
export port=8080
export container=aiops-metisserver
export containerName=aiops-metisserver

cCount=$(docker ps -a|grep $containerName|wc -l)
if [ $cCount -gt 0 ] ; then
  echo "will stop existing container $containerName"
  docker ps -a|grep $containerName|awk -F" " '{print $1}'| xargs docker rm -f
fi
docker run -p ${port}:8080 --network levin-aiops-network \
 --hostname $container \
 -e testing=NO \
 --name $container \
 -d $repo
