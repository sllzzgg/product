#!/bin/bash
 source /opt/data/hive/shop/product/conf/jdbc.properties
 V_MYSQL_DRIVER=${mysql_driver}
 V_URL=${ur}
 V_USERNAME=${mysql_username}
 V_PASSWORD=${mysql_password}

 V_TABLE_NAME=$1
 V_TABLE_QUERY=$2
 V_TABLE_SPLIT=$3
# =====================当参数$2有值时说明增量导入=====================
 if [ ! $V_TABLE_QUERY ]
   then
     
     sqoop import \
     --connect ${V_MYSQL_DRIVER} \
     --username ${V_USERNAME} --password ${V_PASSWORD} \
     --table ${V_TABLE_NAME} -m 3 \
     --target-dir /opt/data/hive/ods_shop/ODS_${V_TABLE_NAME} \
     --delete-target-dir \
     --null-string " " \
     --fields-terminated-by '\t' \
     --hive-drop-import-delims \
     --lines-terminated-by  '\n' 
     

   else
    sqoop import \
     --connect ${V_MYSQL_DRIVER} \
     --username ${V_USERNAME} --password ${V_PASSWORD}  -m 3 \
     --query "${V_TABLE_QUERY}" \
     --target-dir /opt/data/hive/ods_shop/ODS_${V_TABLE_NAME} \
     --null-string " " \
     --split-by "${V_TABLE_SPLIT}" \
     --fields-terminated-by '\t' \
     --append \
     --hive-drop-import-delims \
     --lines-terminated-by  '\n'
 fi

