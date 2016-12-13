#!/bin/bash  

 V_PATH="/opt/data/hive/shop/product/hql/ods"
 
 #######创建商品相关表######
  hive -f ${V_PATH}/ods_shop_brands.sql
  hive -f ${V_PATH}/ods_shop_categories.sql
  hive -f ${V_PATH}/ods_shop_productcategoriesbrand.sql
  hive -f ${V_PATH}/ods_shop_productcategories.sql
  hive -f ${V_PATH}/ods_shop_products.sql
  hive -f ${V_PATH}/ods_shop_producttypebrands.sql
  hive -f ${V_PATH}/ods_shop_producttypes.sql
  hive -f ${V_PATH}/ods_shop_regiondepot.sql
  hive -f ${V_PATH}/ods_shop_suppliers.sql
  hive -f ${V_PATH}/once/ods_shop_orders.sql
  hive -f ${V_PATH}/once/ods_shop_orderItems.sql
  hive -f ${V_PATH}/ods_shop_returnorders.sql
  hive -f ${V_PATH}/ods_shop_order_action.sql
  hive -f ${V_PATH}/ods_shop_returnorderitems.sql

  hive -f ${V_PATH}/ods_accounts_users.sql
  hive -f ${V_PATH}/ods_accounts_usersexp.sql
  hive -f ${V_PATH}/ods_erp_lines.sql
  hive -f ${V_PATH}/ods_shop_shippingaddress.sql
  hive -f ${V_PATH}/ods_erp_depot.sql
  hive -f ${V_PATH}/ods_store.sql
  hive -f ${V_PATH}/ods_wechat_user.sql

###################Mysql table create###############

  hive -f ${V_PATH}/ods_saleorderbill.sql
  hive -f ${V_PATH}/ods_saleorderbilldetail.sql
  hive -f ${V_PATH}/ods_stockstorebill.sql
  hive -f ${V_PATH}/ods_stockstorebilldetail.sql
  hive -f ${V_PATH}/ods_storegoods.sql
   
  
