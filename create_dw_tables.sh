#!/bin/bash  

 V_PATH="/opt/data/hive/shop/product/hql/dw"
 V_OPT=$1 
     
  #######全量操作数据#######################
  
 if [  "$V_OPT"x =  "history"x ]
  then
    
   hive -f ${V_PATH}/DW_Wide_Shop_RegionDepot.sql
   hive -f ${V_PATH}/DW_BASIC_Shop_Products.sql
   hive -f ${V_PATH}/DW_DETAIL_Shop_Products.sql
   hive -f ${V_PATH}/DW_Shop_Categories.sql
   hive -f ${V_PATH}/DW_Shop_Orders.sql
   hive -f ${V_PATH}/DW_Shop_Items.sql 
   hive -f ${V_PATH}/DW_Basic_Accounts_Users.sql 
   hive -f ${V_PATH}/DW_storegoods.sql 
   hive -f ${V_PATH}/DW_SaleOrderBillDetail.sql 
   hive -f ${V_PATH}/DW_Basic_WeChat_Users.sql 
  
 
  else
    #########增量操作数据######################
   yesterday=`date --date='1 days ago' +%Y-%m-%d`
   
  hive -hivevar dtime="${yesterday}" -f  ${V_PATH}/DW_Incr_Shop_Orders.sql 
  hive -hivevar dtime="${yesterday}" -f  ${V_PATH}/DW_Incr_Shop_Items.sql 
  
fi
   
