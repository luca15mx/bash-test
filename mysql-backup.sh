#!/bin/bash
### Purpose: mysql.backup.sh : Backup database ###
### Author: Vivek Gite <https://www.cyberciti.biz>, under GPL v2.x+ or above. ###
### Change as per your needs ###
set -eo pipefail
MUSER='USERNAME-here'
MPASS='PASSWORD-here'
MHOST='10.0.3.100'  
DEST="/nfs42/backups/mysql"
NOWFORMAT="%m_%d_%Y_%H_%M_%S%P"
MYSQL="/usr/bin/mysql"
MYSQLDUMP="/usr/bin/mysqldump"
MKDIR="/bin/mkdir"
RM="/bin/rm"
GZIP="/bin/gzip"
DATE="/bin/date"
SED="/bin/sed"
 
# Failsafe? Create dir #
[  ! -d "$DEST" ] && $MKDIR -p "$DEST"
 
# Filter db names
DBS="$($MYSQL -u $MUSER -h $MHOST -p$MPASS -Bse 'show databases')"
DBS="$($SED -e 's/performance_schema//' -e 's/information_schema//' <<<$DBS)"
 
# Okay, let us go
for db in $DBS
do
                tTime=$(date +"${NOWFORMAT}")
                FILE="$DEST/${db}.${tTime}.gz"
                $MYSQLDUMP -u $MUSER -h $MHOST -p$MPASS $db | $GZIP -9 > $FILE
				if [ ${PIPESTATUS[0]} -ne "0" ];
				then
				    echo "The command $MYSQLDUMP failed with error code ${PIPESTATUS[0]}."
				    exit 1
				else
				    echo "Database $db dump successfully."
				fi
