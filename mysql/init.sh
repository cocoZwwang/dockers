#!bin/bash
mysql=( mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" )
files=$(ls $WORK_PATH/$SQL_DIR | grep ".sql")
echo ${files}
for f in ${files}; do
	echo "source $WORK_PATH/$SQL_DIR/$f;" | "${mysql[@]}"
done