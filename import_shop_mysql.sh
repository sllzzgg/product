#!/bin/bash
##### It was export sqlserver history to hive with sqoop  only a once 
########################EXPORT　SQLSERVER HISTORY DATA TO HIVE###########

   source /opt/data/hive/shop/product/conf/import_tables.properties
   
   V_TABLES=${mysql_all_tables}
   ARR_V_TABLE=($V_TABLES)

  for table in ${ARR_V_TABLE[@]}
    do
       echo ################### Start to import the table $table ################# 
       /opt/data/hive/shop/product/sqoop_import_mysql.sh $table >> /opt/data/hive/shop/product/logs/sqoop_import_mysql.log

    done

