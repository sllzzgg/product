#!/bin/bash
 source /opt/data/hive/shop/product/conf/jdbc.properties
 
 V_TABLE=$1
 V_DATA_URL=$2

   V_MYSQL=${mysql_driver_export}
   V_URL=${ur}
   V_USERNAME=${mysql_username_export}
   V_PASSWORD=${mysql_password_export} 
 
  sqoop export \
   --connect ${V_MYSQL} \
   --username ${V_USERNAME} --password ${V_PASSWORD} \
   --table ${V_TABLE}  -m 1 \
   --export-dir ${V_DATA_URL} \
   --input-fields-terminated-by '\t' \
   --input-null-non-string '\\N' \
   --input-null-string '\\N'                            
