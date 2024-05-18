#!/bin/bash

# Tentukan path lengkap ke perintah git
GIT_COMMAND=/usr/bin/git

# Direktori kerja untuk perintah git
GIT_WORKING_DIR=/home/nandan/backup

# Nama file backup
backup_file="$GIT_WORKING_DIR/test/file_$(date +\%Y\%m\%d_\%H\%M\%S).txt"

# Eksekusi pg_dump untuk membuat backup
touch $backup_file

# Masuk ke direktori kerja Git
cd $GIT_WORKING_DIR

# Tambahkan file ke Git
$GIT_COMMAND -C $GIT_WORKING_DIR add $backup_file

# Commit perubahan
$GIT_COMMAND -C $GIT_WORKING_DIR commit -m "Backup file pada $(date +\%Y\%m\%d_\%H\%M\%S)"

# Push ke repository GitHub
$GIT_COMMAND -C $GIT_WORKING_DIR push origin master
