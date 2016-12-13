CREATE EXTERNAL TABLE IF NOT EXISTS ods_shop.`ODS_Shop_ShippingAddress`(
  `shippingid` int, 
  `regionid` int, 
  `userid` int, 
  `shipname` string, 
  `address` string, 
  `zipcode` string, 
  `emailaddress` string, 
  `telphone` string, 
  `celphone` string, 
  `isdefault` boolean, 
  `aliases` string, 
  `latitude` double, 
  `longitude` double, 
  `lineid` int, 
  `circleid` int, 
  `remark` string, 
  `depotid` int
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_Shop_ShippingAddress';