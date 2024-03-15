#!/usr/bin/env bash
set -x
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)

cd $SCRIPT_DIR

tag=$(cat $SCRIPT_DIR/repo.tag)
export port=13306
export container=aiops-metisdb
docker run \
 -d \
 -p ${port}:3306 --network levin-aiops-network \
 --hostname $container \
  -v /data/metis/mysql/:/var/lib/mysql:Z -e MYSQL_ROOT_PASSWORD=metis@123 \
 -e testing=NO \
 --name $container \
 -d  $tag
