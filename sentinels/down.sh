#!/bin/bash

docker stop redis_master
docker rm redis_master

docker stop redis_slave_1
docker rm redis_slave_1
docker stop redis_slave_2
docker rm redis_slave_2
docker stop redis_slave_3
docker rm redis_slave_3

docker stop redis_sentinel_1
docker rm redis_sentinel_1
docker stop redis_sentinel_2
docker rm redis_sentinel_2
docker stop redis_sentinel_3
docker rm redis_sentinel_3
