# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# author:   xeast
# date:     20180712
# function: 获取车捡数据库的每一种照片通过率并写入文件
# # # # # # ## # # # # # ## #  ## # # ## # ## # # ## # # # ## # # # # ##  ### # # ## # ## # # ## # ## #  ## # #   ## # # ##

#!/bin/bash

`rm ~/result.csv`

HOSTNAME="localhost"
PORT="3306"
USERNAME="root"
PASSWORD="em-data-9527"

DBNAME="car_schema"
TABLENAME="check_infos"

CATEGORY=(\"0111\" \"0112\" \"0113\" \"0157\" \"0201\" \"0202\" \"0203\" \"0204\" \"0205\" \"0206\" \"0224\" \"0321\" \"0322\" \"0348\" \"0351\" \"0344\" \"0342\" \"0323\" ) #nan ning

for var in  ${CATEGORY[*]}
do
    echo ${var} >> ~/result.csv 
    select_sql="select reason,count(reason) as count from ${TABLENAME} where category like ${var} and created_at > \"2018-07-24 00:00:00\" and created_at < \"2018-07-25 00:00:00\" group by reason"
    mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}" >> ~/result.csv
    echo "通过率：" >> ~/result.csv
done
