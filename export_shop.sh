#!/bin/bash
  
   d=$1
   V_PATH=/opt/data/hive/shop/product/sqoop_export.sh
    if [  "$d"x =  "history"x ]
    
    then
 
       ########export all history data to mysql  

        yesterday=*
     else
      ########export daily data from yesterday to mysql
      # $1 : yesterday or the date of  manually setting
         if [ ! $d ]
          then
             yesterday=`date --date='1 days ago' +%Y-%m-%d`
         else
             yesterday=$d
         fi
      fi
            ###################################################
            # the first paramter: table name with export mysql # 
            # the second paramter: data dir from hdfs          #
            ####################################################  
             echo "================================开始导出数据，时间:$yesterday============"        

            ${V_PATH} dm_daily_shop_category /opt/data/hive/dm_shop/DM_daily_shop_category/dt=${yesterday} 
            ${V_PATH} dm_daily_shop_brand /opt/data/hive/dm_shop/DM_daily_shop_brand/dt=${yesterday}
            ${V_PATH} dm_daily_shop_products /opt/data/hive/dm_shop/DM_daily_shop_products/dt=${yesterday}
            ${V_PATH} dm_daily_shop_orders_count /opt/data/hive/dm_shop/DM_daily_shop_orders_count/dt=${yesterday}
            ${V_PATH} dm_daily_shop_orders_source /opt/data/hive/dm_shop/DM_daily_shop_orders_source/dt=${yesterday}
            ${V_PATH} dm_daily_shop_products_flow /opt/data/hive/dm_shop/DM_daily_shop_products_flow/dt=${yesterday}
            ${V_PATH} dm_daily_shop_products_statis /opt/data/hive/dm_shop/DM_daily_Shop_Products_statis/dt=${yesterday}
            ${V_PATH} dm_daily_shop_supplier_statis /opt/data/hive/dm_shop/DM_daily_shop_supplier_statis/dt=${yesterday}
            ${V_PATH} dm_daily_shop_supplier_orders /opt/data/hive/dm_shop/DM_daily_supplier_orders/dt=${yesterday}
            ${V_PATH} dm_account_users_count /opt/data/hive/dm_shop/DM_daily_Account_user_statis/dt=${yesterday}
            ${V_PATH}  dm_wechat_users_count /opt/data/hive/dm_shop/DM_daily_WeChat_user_count/dt=${yesterday}

    

   
