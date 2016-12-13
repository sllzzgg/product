#!/bin/bash
##### It was export sqlserver history to hive with sqoop  only a once 
########################EXPORT　SQLSERVER HISTORY DATA TO HIVE###########

   source /opt/data/hive/shop/product/conf/import_tables.properties
   
   start_date=$1
   end_date=$2 
   v_length=$#
  
  ########## if there was no parameters found,then it was operated the yeseterday data
  ######### if there was tow parameters found,then the first is start date,the other is end date
   if [ $v_length -ne 2  ]
    then
      yesterday=`date --date='1 days ago' +%Y-%m-%d`
      start_date=$yesterday
      end_date=$yesterday
   fi

   V_INCR_TABLES=${incr_tables}
   
   V_ORDER_QUERY="select  o.* from Shop_Orders o where \$CONDITIONS and UpdatedDate >= '${start_date} 00:00:00' and UpdatedDate <= '${end_date} 23:59:59'"
   V_ORDER_ITEM_QUERY="SELECT item.* from Shop_OrderItems item left JOIN Shop_Orders o on item.OrderId=o.OrderId where \$CONDITIONS and UpdatedDate >= '${start_date} 00:00:00' and UpdatedDate <= '${end_date} 23:59:59'"
   V_ORDER_SPLIT="o.OrderId"
   V_ORDER_ITEM_SPLIT="item.ItemId"
   /opt/data/hive/shop/product/sqoop_import.sh "Shop_Orders" "${V_ORDER_QUERY}" ${V_ORDER_SPLIT}
   /opt/data/hive/shop/product/sqoop_import.sh "Shop_OrderItems" "${V_ORDER_ITEM_QUERY}" ${V_ORDER_ITEM_SPLIT}

  ###################Mysql data import################################
  V_SALE_QUERY="SELECT * from saleorderbill WHERE \$CONDITIONS and  makeDate ='${start_date}'"
  V_SALE_SPLIT="id"
  
  V_SALE_DETAIL_QUERY="SELECT t2.* from saleorderbilldetail t2 LEFT JOIN saleorderbill t1 on (t2.bill_id = t1.id)
                            WHERE \$CONDITIONS and makeDate ='${start_date}'"
  V_SALE_DETAIL_SPLIT="t2.id"

  V_STOCK_QUERY="SELECT * FROM stockstorebill WHERE \$CONDITIONS and storeDate >='${start_date} 00:00:00' and storeDate<='${end_date} 23:59:59'"
  V_STOCK_SPLIT="id"

  V_STOCK_DETAIL_QUERY="SELECT t2.* from stockstorebilldetail t2 LEFT JOIN stockstorebill t1 on t2.bill_id = t1.id
                         WHERE \$CONDITIONS and  storeDate >='${start_date} 00:00:00' and storeDate < '${end_date} 23:59:59'"
  V_STOCK_DETAIL_SPLIT="t2.id"

   /opt/data/hive/shop/product/sqoop_import_mysql.sh saleorderbill "${V_SALE_QUERY}" ${V_SALE_SPLIT}
   /opt/data/hive/shop/product/sqoop_import_mysql.sh saleorderbilldetail  "${V_SALE_DETAIL_QUERY}" ${V_SALE_DETAIL_SPLIT}
   /opt/data/hive/shop/product/sqoop_import_mysql.sh stockstorebill "${V_STOCK_QUERY}" ${V_STOCK_SPLIT}
   /opt/data/hive/shop/product/sqoop_import_mysql.sh stockstorebilldetail  "${V_STOCK_DETAIL_QUERY}" ${V_STOCK_DETAIL_SPLIT}
