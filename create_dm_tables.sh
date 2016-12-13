#!/bin/bash  

 V_PATH="/opt/data/hive/shop/product/hql/dm"
 V_OPT=$1 
     
  
 if [  "$V_OPT"x =  "history"x ]
  then
 hive -f ${V_PATH}/DM_create_tables.sql

 hive -f ${V_PATH}/DM_history_account_user_statis.sql
 hive -f ${V_PATH}/DM_history_daily_supplier_orders.sql
 hive -f ${V_PATH}/DM_history_shop_brand.sql
 hive -f ${V_PATH}/DM_history_shop_category.sql
 hive -f ${V_PATH}/DM_history_shop_orders_count.sql
 hive -f ${V_PATH}/DM_history_shop_orders_source.sql
 hive -f ${V_PATH}/DM_history_shop_products_flow.sql
 hive -f ${V_PATH}/DM_history_shop_products.sql
 hive -f ${V_PATH}/DM_history_shop_products_statis.sql
 hive -f ${V_PATH}/DM_history_shop_supplier_statis.sql
 hive -f ${V_PATH}/DM_history_wechat_user_count.sql  
 
  else
    #########增量操作数据######################
  yesterday=`date --date='1 days ago' +%Y-%m-%d`
  if [ $V_OPT ]
   then
     yesterday=$V_OPT
  fi
   echo "####################### DM_daily_shop_category is running ##################"
   hive -hivevar dtime="${yesterday}" -f  ${V_PATH}/DM_daily_shop_category.sql
   
   echo "####################### DM_daily_shop_brand is running ##################"
   hive -hivevar dtime="${yesterday}" -f  ${V_PATH}/DM_daily_shop_brand.sql 

   echo "####################### DM_daily_shop_products is running ##################"
   hive -hivevar dtime="${yesterday}" -f  ${V_PATH}/DM_daily_shop_products.sql

   echo "####################### DM_daily_shop_orders_count is running ##################"
   hive -hivevar dtime="${yesterday}" -f  ${V_PATH}/DM_daily_shop_orders_count.sql
 
   echo "####################### DM_daily_shop_orders_source ##################"
   hive -hivevar dtime="${yesterday}" -f  ${V_PATH}/DM_daily_shop_orders_source.sql
 
   echo "####################### DM_daily_shop_products_flow is running ##################" 
   hive -hivevar dtime="${yesterday}" -f  ${V_PATH}/DM_daily_shop_products_flow.sql 

  echo "####################### DM_daily_shop_products_statis is running ##################"
   hive -hivevar dtime="${yesterday}" -f  ${V_PATH}/DM_daily_shop_products_statis.sql

  echo "####################### DM_daily_account_user_statis is running ##################" 
   hive -hivevar dtime="${yesterday}" -f  ${V_PATH}/DM_daily_account_user_statis.sql 

  echo "####################### DM_daily_wechat_user_count is running ##################"
   hive -hivevar dtime="${yesterday}" -f  ${V_PATH}/DM_daily_wechat_user_count.sql 

  
fi
   
