#!/bin/bash
##### drop the tables from Hive before import them from Sqlserver every day####
  
 hive -e "use shop " 
 
 hive -S -e "DROP TABLE Shop_Products;" >> /shop_products.log
 hive -S -e "DROP TABLE Shop_ProductCategories;"
 hive -S -e "DROP TABLE Shop_ProductCategoriesBrand;"
 hive -S -e "DROP TABLE Shop_Brands;"
 hive -S -e "DROP TABLE Shop_Categories;"
 ###### hive -S -e "DROP TABLE Shop_RegionDepot;"
