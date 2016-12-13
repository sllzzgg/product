#!/bin/bash
 source /opt/data/hive/shop/product/conf/jdbc.properties
 V_SQLSERVER_DRIVER=${driver}
 V_URL=${ur}
 V_USERNAME=${username}
 V_PASSWORD=${password}

 V_TABLE_NAME=$1
 V_TABLE_QUERY=$2
 V_TABLE_SPLIT=$3
# =====================当参数$2有值时说明增量导入=====================
 if [ ! $V_TABLE_QUERY ]
   then
     
     sqoop import \
     --connect ${V_SQLSERVER_DRIVER} \
     --table ${V_TABLE_NAME} -m 1 \
     --target-dir /opt/data/hive/ods_shop/ODS_${V_TABLE_NAME} \
     --delete-target-dir \
     --null-string " " \
     --fields-terminated-by '\t' \
     --hive-drop-import-delims \
     --null-string '\\N' --null-non-string '\\N' \
     --lines-terminated-by  '\n' 
     

   else
    sqoop import \
     --connect ${V_SQLSERVER_DRIVER} \
      -m 3 \
     --query "$V_TABLE_QUERY" \
     --target-dir /opt/data/hive/ods_shop/ODS_${V_TABLE_NAME} \
     --null-string " " \
     --split-by "${V_TABLE_SPLIT}" \
     --fields-terminated-by '\t' \
     --append \
     --hive-drop-import-delims \
     --lines-terminated-by  '\n'
 fi

