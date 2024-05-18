#!/bin/bash

# Direktori konfigurasi dan data
BASE_DIR=/home/nandan/workdir/sentinels
REDIS_CONF_DIR=$BASE_DIR/redis-conf
REDIS_DATA_DIR=$BASE_DIR/lib
REDIS_LOG_DIR=$BASE_DIR/log
REDIS_PID_DIR=$BASE_DIR/run
SENTINEL_CONF_DIR=$BASE_DIR/sentinel-conf

# Buat direktori konfigurasi dan data jika belum ada
mkdir -p $REDIS_CONF_DIR $REDIS_DATA_DIR $REDIS_LOG_DIR $REDIS_PID_DIR $SENTINEL_CONF_DIR
mkdir -p $REDIS_DATA_DIR/redis1 $REDIS_DATA_DIR/redis2 $REDIS_DATA_DIR/redis3

# Salin file konfigurasi jika belum ada
if [ ! -f $REDIS_CONF_DIR/redis1.conf ]; then
    touch $REDIS_CONF_DIR/redis1.conf
    echo "port 6379" >> $REDIS_CONF_DIR/redis1.conf
    echo "dir $REDIS_DATA_DIR/redis1" >> $REDIS_CONF_DIR/redis1.conf
    echo "logfile $REDIS_LOG_DIR/redis1.log" >> $REDIS_CONF_DIR/redis1.conf
    echo "pidfile $REDIS_PID_DIR/redis1.pid" >> $REDIS_CONF_DIR/redis1.conf
fi

if [ ! -f $REDIS_CONF_DIR/redis2.conf ]; then
    touch $REDIS_CONF_DIR/redis2.conf
    echo "port 6380" >> $REDIS_CONF_DIR/redis2.conf
    echo "dir $REDIS_DATA_DIR/redis2" >> $REDIS_CONF_DIR/redis2.conf
    echo "logfile $REDIS_LOG_DIR/redis2.log" >> $REDIS_CONF_DIR/redis2.conf
    echo "pidfile $REDIS_PID_DIR/redis2.pid" >> $REDIS_CONF_DIR/redis2.conf
    echo "replicaof 127.0.0.1 6379" >> $REDIS_CONF_DIR/redis2.conf
fi

if [ ! -f $REDIS_CONF_DIR/redis3.conf ]; then
    touch $REDIS_CONF_DIR/redis3.conf
    echo "port 6381" >> $REDIS_CONF_DIR/redis3.conf
    echo "dir $REDIS_DATA_DIR/redis3" >> $REDIS_CONF_DIR/redis3.conf
    echo "logfile $REDIS_LOG_DIR/redis3.log" >> $REDIS_CONF_DIR/redis3.conf
    echo "pidfile $REDIS_PID_DIR/redis3.pid" >> $REDIS_CONF_DIR/redis3.conf
    echo "replicaof 127.0.0.1 6379" >> $REDIS_CONF_DIR/redis3.conf
fi

# Salin file konfigurasi Sentinel jika belum ada
if [ ! -f $SENTINEL_CONF_DIR/sentinel1.conf ]; then
    touch $SENTINEL_CONF_DIR/sentinel1.conf
    echo "port 26379" >> $SENTINEL_CONF_DIR/sentinel1.conf
    echo "sentinel monitor mymaster 127.0.0.1 6379 2" >> $SENTINEL_CONF_DIR/sentinel1.conf
    echo "sentinel down-after-milliseconds mymaster 5000" >> $SENTINEL_CONF_DIR/sentinel1.conf
    echo "sentinel failover-timeout mymaster 10000" >> $SENTINEL_CONF_DIR/sentinel1.conf
    echo "sentinel parallel-syncs mymaster 1" >> $SENTINEL_CONF_DIR/sentinel1.conf
    echo "logfile $REDIS_LOG_DIR/sentinel1.log" >> $SENTINEL_CONF_DIR/sentinel1.conf
fi

if [ ! -f $SENTINEL_CONF_DIR/sentinel2.conf ]; then
    touch $SENTINEL_CONF_DIR/sentinel2.conf
    echo "port 26380" >> $SENTINEL_CONF_DIR/sentinel2.conf
    echo "sentinel monitor mymaster 127.0.0.1 6379 2" >> $SENTINEL_CONF_DIR/sentinel2.conf
    echo "sentinel down-after-milliseconds mymaster 5000" >> $SENTINEL_CONF_DIR/sentinel2.conf
    echo "sentinel failover-timeout mymaster 10000" >> $SENTINEL_CONF_DIR/sentinel2.conf
    echo "sentinel parallel-syncs mymaster 1" >> $SENTINEL_CONF_DIR/sentinel2.conf
    echo "logfile $REDIS_LOG_DIR/sentinel2.log" >> $SENTINEL_CONF_DIR/sentinel2.conf
fi

if [ ! -f $SENTINEL_CONF_DIR/sentinel3.conf ]; then
    touch $SENTINEL_CONF_DIR/sentinel3.conf
    echo "port 26381" >> $SENTINEL_CONF_DIR/sentinel3.conf
    echo "sentinel monitor mymaster 127.0.0.1 6379 2" >> $SENTINEL_CONF_DIR/sentinel3.conf
    echo "sentinel down-after-milliseconds mymaster 5000" >> $SENTINEL_CONF_DIR/sentinel3.conf
    echo "sentinel failover-timeout mymaster 10000" >> $SENTINEL_CONF_DIR/sentinel3.conf
    echo "sentinel parallel-syncs mymaster 1" >> $SENTINEL_CONF_DIR/sentinel3.conf
    echo "logfile $REDIS_LOG_DIR/sentinel3.log" >> $SENTINEL_CONF_DIR/sentinel3.conf
fi

# Jalankan Redis instances di background
redis-server $REDIS_CONF_DIR/redis1.conf &
redis-server $REDIS_CONF_DIR/redis2.conf &
redis-server $REDIS_CONF_DIR/redis3.conf &

# Jalankan Sentinel instances di background
redis-server $SENTINEL_CONF_DIR/sentinel1.conf --sentinel &
redis-server $SENTINEL_CONF_DIR/sentinel2.conf --sentinel &
redis-server $SENTINEL_CONF_DIR/sentinel3.conf --sentinel &

echo "Redis instances and Sentinels are running in the background. Check log files for details."
