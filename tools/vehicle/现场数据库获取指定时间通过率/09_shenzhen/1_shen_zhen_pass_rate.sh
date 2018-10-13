#!/bin/bash

date1='2018-09-01'
date2='2018-09-26'
for cate in '0111' '0112' '0113' '0157' '0201' '0203' '0215' '0216' '0261' '0259' '0204' '0202' '0209' '0321' '0352' '0322' '0348' '0351' '0344' '0342' '0323'	
do

mysql -uroot -pem-data-9527 car_schema --default-character-set='utf8' -N -e "SELECT reason,count(reason)  FROM car_schema.check_infos where category='$cate' and result in('1','5') and created_at>'$date1' and created_at<'$date2' group by reason " >> shen_zhen_pass_rate.csv;

done
