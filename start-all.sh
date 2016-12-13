#!/bin/bash
 ####Import all data from sqlserver####
  /opt/data/hive/shop/product/import_shop_product.sh
 
 ###Import yesterday data from sqlserver###
 /opt/data/hive/shop/product/import_incr_shop.sh

 ###create DW table from ods####
   /opt/data/hive/shop/product/create_dw_tables.sh
###create DW data with increment from ods###
 # /opt/data/hive/shop/product/create_dw_tables.sh

