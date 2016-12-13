CREATE EXTERNAL TABLE IF NOT EXISTS dw_shop.`DW_storegoods`(
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
  `store_name` string,
  `goods_id` bigint,
  `goods_name` string,
  `sectionnumber` string,
  `kokura_id` bigint,
  `kokura_name` string,
  `region_id` int,
  `region_name` string
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dw_shop/DW_storegoods';  


INSERT OVERWRITE TABLE dw_shop.DW_storegoods
SELECT
 t1.`active` , 
 t1.`costmoney` , 
 t1.`costoperateway` , 
 t1.`costprice` , 
 t1.`forwardmoney` , 
 t1.`forwardnum` , 
 t1.`forwardprice`, 
 t1.`forwardquantity` ,
 t1.`initmoney` , 
 t1.`initprice` , 
 t1.`initquantity` , 
 t1.`jwh` , 
 t1.`rates` , 
 t1.`salequantity` , 
 t1.`stockclv` , 
 t1.`stockflv` , 
 t1.`stocknv` , 
 t1.`storeqty` , 
 t1.`store_id` ,
 t2.`name` ,
 t1.`goods_id` ,
 t4.`ProductName` ,
 t1.`sectionnumber` ,
 t2.`kokura_id` ,
 t3.`name`,
 t5.`regionid`,
 t5.`RegionName`
FROM ods_shop.ODS_storegoods t1 
LEFT JOIN  ods_shop.ODS_store t2
on (t1.store_Id = t2.id)
LEFT JOIN ods_shop.ODS_erp_depot t3
on (t2.kokura_id = t3.depotid)
LEFT JOIN ods_shop.ODS_shop_products t4 
on (t4.ProductId = t1.goods_id)
LEFT JOIN ods_shop.ODS_shop_regiondepot t5 
on (t4.regionid = t5.regionid);
