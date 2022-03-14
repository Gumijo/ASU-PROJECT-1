#!/bin/bash

#Create files/check if backups exists
if [ ! -d $HOME/backups ]
then
 mkdir $HOME/backups && mkdir $HOME/backups/{freemen,diskuse,openlist,freedisk}
fi	

echo "Memory:" > $HOME/backups/freemen/free_mem.txt
free > $HOME/backups/freemen/free_mem.txt

echo "Disk space statics:" > $HOME/backups/freedisk/free_disk.txt
du -h >> $HOME/backups/freedisk/free_disk.txt

echo "Disk Usage:" > $HOME/backups/diskuse/disk_usage.txt
df -H >> $HOME/backups/diskuse/disk_usage.txt

echo "All your open files are:" > $HOME/backups/openlist/open_list.txt
sudo lsof >> $HOME/backups/openlist/open_list.txt 
