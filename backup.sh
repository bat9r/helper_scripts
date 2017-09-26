#!/bin/bash
echo "For backup MySQL database enter 'm', for backup /var/www enter 'v', for backup both 'mv'"
read choice
if [[ $choice = 'm' ]] || [[ $choice = 'mv' ]]
then
	echo "MySQL User:"
	read user
	echo "MySQL Password:"
	read password
	echo "Database name"
	read db_name
fi

date=$(date +"%s")
files_list=($(find . -name 'backup*'))
last_date=0
for name in ${files_list[@]}
do
	sec=${name##*-}
	if [[ ${sec%%.*} -gt ${last_date} ]]
	then
		last_date=${sec%%.*}
	fi
done
echo $last_date
echo $date
if (( $last_date+1209600 < $date ))
then
	backup_path="$PWD"
	backup_file_name=backup-$date.tar.gz
	mkdir temp_backup 
	if [[ $choice = 'm' ]] || [[ $choice = 'mv' ]]
	then
		mysqldump -u$user -p$password --host=$host $db_name > $backup_path/temp_backup/$db_name-$date.sql
	fi
	cp -r /var/www $PWD/temp_backup
	tar -czpf $backup_path/$backup_file_name temp_backup
	rm -r temp_backup
else
	echo "A backup made made less than 2 weeks ago"
fi
