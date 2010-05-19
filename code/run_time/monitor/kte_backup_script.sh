#!/bin/bash
# ------------------------------------------------------------------------------
# Shell script for Mysql db backup and WebCrawler logs 
# 
# Author: Kube Partners Italy
# ------------------------------------------------------------------------------

export PATH=$PATH:. ; 
NOW=`date +"%Y-%m-%d"`;

# ------------------------------------------------------------------------------
# Script Usage
# ------------------------------------------------------------------------------
if [[ $# == 0  || $# -gt 1 ]]; then 
   echo "Usage: script.sh [properties file]" ;
   echo "example: script.sh file.properties " ;
   exit 0 ;
fi
# ------------------------------------------------------------------------------
# Variables configured using a properties file
# ------------------------------------------------------------------------------
if [  $# == 1 ]; then 
   PFILE=$1 ;     
   IDRILEVAZIONE=`awk -F"#" '/IDRILEVAZIONE/{print $2}' $PFILE`;
   KTELOGDIR=`awk -F"#" '/KTELOGSDIR/{print $2}'    $PFILE`;
   WORKDIR=`awk -F"#" '/WORKDIR/{print $2}'       $PFILE`;
   BACKUPDIR=`awk -F"#" '/WORKDIR/{print $2}'       $PFILE`/$NOW;
   MSQLUSER=`awk -F"#" '/MSQLUSER/{print $2}'      $PFILE`;
   MSQLPASS=`awk -F"#" '/MSQLPASS/{print $2}'      $PFILE`;
   MSQLHOST=`awk -F"#" '/MSQLHOST/{print $2}'      $PFILE`;
   MSQLPORT=`awk -F"#" '/MSQLPORT/{print $2}'      $PFILE`;
   IGNOREDB=`awk -F"#" '/IGNOREDB/{print $2}'      $PFILE`;
   SMTPHOST=`awk -F"#" '/SMTPHOST/{print $2}'      $PFILE`;
   SMTPPORT=`awk -F"#" '/SMTPPORT/{print $2}'      $PFILE`;
   SMTPUSER=`awk -F"#" '/SMTPUSER/{print $2}'      $PFILE`;
   SMTPPASS=`awk -F"#" '/SMTPPASS/{print $2}'      $PFILE`;
   SMTPFROM=`awk -F"#" '/SMTPFROM/{print $2}'      $PFILE`;
   SMTPTO=`awk -F"#" '/SMTPTO/{print $2}'        $PFILE`;
   SMTPSUBJECT=`awk -F"#" '/SMTPSUBJECT/{print $2}'   $PFILE`;
   SMTPBODY=`awk -F"#" '/SMTPBODY/{print $2}'      $PFILE`;
   SMTPATTACH=`awk -F"#" '/SMTPATTACH/{print $2}'    $PFILE`;
   LOGFILE=`awk -F"#" '/LOGFILE/{print $2}'    $PFILE`;
   QUERY1=`awk -F"#" '/QUERY1/{print $2}'    $PFILE`;
   QUERY2=`awk -F"#" '/QUERY2/{print $2}'    $PFILE`;
fi 

# ------------------------------------------------------------------------------
# MySQL binaries 
# ------------------------------------------------------------------------------
MYSQL=`which mysql`;
MYSQLDUMP=`which mysqldump`;
GZIP=`which gzip`;

# ------------------------------------------------------------------------------
# Work and MySQL db backup directory
# ------------------------------------------------------------------------------
if [ ! -d $WORKDIR ]; then
  mkdir -p $WORKDIR
else
   #rm $LOGFILE
   rm -r $WORKDIR
   mkdir -p $WORKDIR
   mkdir -p $BACKUPDIR
fi

# ------------------------------------------------------------------------------
# MySQL db list
# ------------------------------------------------------------------------------
DBS="$(mysql -u $MSQLUSER -p$MSQLPASS -h $MSQLHOST -P $MSQLPORT -Bse 'show databases')"

NOW=`date +"%Y%m%d%H%M%S"` ; 

echo "Log Timestamp - $NOW" > $LOGFILE

# ------------------------------------------------------------------------------
# dump MySQL db one by one
# ------------------------------------------------------------------------------
echo "-- MYSQL BACKUP -- " >> $LOGFILE
for db in $DBS
do
        DUMP="yes";
        if [ "$IGNOREDB" != "" ]; then
                for i in $IGNOREDB # Store all value of $IGNOREDB ON i
                do
                        if [ "$db" == "$i" ]; then # If result of $DBS(db) is equal to $IGNOREDB(i) then
                                DUMP="NO";         # set value of DUMP to "no"
                                echo "IGNORED DB $i" >> $LOGFILE;
                        fi
                done
        fi
        if [ "$DUMP" == "yes" ]; then # If value of DUMP is "yes" then backup database
                FILE="$BACKUPDIR/$NOW-$db.gz";
                echo "BACKING UP $db"  >> $LOGFILE;
                $MYSQLDUMP --add-drop-database --opt --lock-all-tables -u $MSQLUSER -p$MSQLPASS -h $MSQLHOST -P $MSQLPORT $db | gzip > $FILE 
        fi
done

$MYSQL --user=$MSQLUSER --password=$MSQLPASS -t -e "SELECT count(id_profilo_assicurativo) N_Prices, id_compagnia  FROM Quixa_premi.premi_216 p where id_rilevazione = $IDRILEVAZIONE group by id_compagnia order by 1" > $WORKDIR/premi_output.txt
$MYSQL --user=$MSQLUSER --password=$MSQLPASS -t -e "SELECT count(*) Test_KO, compagnia FROM Quixa_scheduler.tests_216 t where esito_test = 'KO' group by Compagnia  order by 1 desc" > $WORKDIR/ko_output.txt
$MYSQL --user=$MSQLUSER --password=$MSQLPASS -t -e "DELETE FROM Quixa_scheduler.tests_216"

# ------------------------------------------------------------------------------
# WebCrawler Logs compression
# ------------------------------------------------------------------------------
cd $KTELOGDIR
tar -czf $NOW.ID_$IDRILEVAZIONE.logs.tar.gz * 
mv $NOW.ID_$IDRILEVAZIONE.logs.tar.gz $WORKDIR
rm $KTELOGDIRwebcrawler.log

# ------------------------------------------------------------------------------
# WebCrawler and Mysql db backups compressed in a unique file
# ------------------------------------------------------------------------------
cd $WORKDIR
tar -czf ID_$IDRILEVAZIONE.$NOW.backup.tar.gz * 

# ------------------------------------------------------------------------------
# S3 Copy
# ------------------------------------------------------------------------------
echo "-- S3 COPY -- " >> $LOGFILE
/usr/local/bin/s3cmd put ID_$IDRILEVAZIONE.$NOW.backup.tar.gz s3://kubepartners-europe/backup/kte/ID_$IDRILEVAZIONE.$NOW.backup.tar.gz >> $LOGFILE

# ------------------------------------------------------------------------------
# Mail 
# ------------------------------------------------------------------------------
echo "-- MAIL -- " >> $LOGFILE
ATTACH="" ; 
TO="" ;
for a in $SMTPATTACH
do
  ATTACH="--attach $a $ATTACH" ;
done
echo $ATTACH ; 

for t in $SMTPTO
do
  TO="--to $t $TO" ;
done
echo "MAIL SENT TO $TO"  >> $LOGFILE; 

# ------------------------------------------------------------------------------
# Mail Subject and Body 
# ------------------------------------------------------------------------------
SMTPSUBJECT="Backup ID Rilevazione $IDRILEVAZIONE effettuato con successo - Timestamp: $NOW" ;
SMTPBODY="Backup ID Rilevazione $IDRILEVAZIONE effettuato con successo - Timestamp: $NOW"   ;

# ------------------------------------------------------------------------------
# smtp-cli command
# ------------------------------------------------------------------------------
/usr/local/bin/smtp-cli --verbose --host=$SMTPHOST --port=$SMTPPORT --enable-auth --user $SMTPUSER --pass $SMTPPASS --from $SMTPFROM $TO --subject "$SMTPSUBJECT" --body "$SMTPBODY" --attach $LOGFILE $ATTACH > $WORKDIR/smtp-cli.txt
sleep 5
# ------------------------------------------------------------------------------

exit 0
