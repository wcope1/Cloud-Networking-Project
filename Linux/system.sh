#!/bin/bash

#Print free memory
free -h > ~/backups/freemem/free_mem.txt

#Print ALL disk usage
du -h > ~/backups/diskuse/disk_usage.txt

#List of currently open files
lsof > ~/backups/openlist/open_list.txt

#Print file system disk space stats
df -h > ~/backups/freedisk/free_disk.txt
