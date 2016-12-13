CREATE EXTERNAL TABLE IF NOT EXISTS ods_shop.`ODS_storegoods`(
  `active` boolean, 
  `costmoney` double, 
  `costoperateway` string, 
  `costprice` double, 
  `forwardmoney` double, 
  `forwardnum` string, 
  `forwardprice` double, 
  `forwardquantity` double, 
  `initmoney` double, 
  `initprice` double, 
  `initquantity` double, 
  `jwh` string, 
  `rates` double, 
  `salequantity` double, 
  `stockclv` double, 
  `stockflv` double, 
  `stocknv` double, 
  `storeqty` double, 
  `store_id` bigint, 
  `goods_id` bigint, 
  `sectionnumber` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_storegoods';  