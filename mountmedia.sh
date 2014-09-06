#!/bin/bash
#this script (to be run on init) mounts the media folder in the home directory of all sftp group users

sftpusers=(`awk -F':' '/^sftp/{print $4}' /etc/group | tr ',' ' '`)
for user in ${sftpusers[@]}
do
  mkdir -p /mnt/wdvol/${user}/media
  mount_nullfs /mnt/wdvol/media /mnt/wdvol/${user}/media
done
