CREATE EXTERNAL TABLE IF NOT EXISTS  ods_shop.`ODS_Store`(
  `id` bigint, 
  `active` boolean, 
  `area` double, 
  `bldeliver` boolean, 
  `blretail` boolean, 
  `code` string, 
  `governor` string, 
  `helpcode` string, 
  `name` string, 
  `personcount` int, 
  `address` string, 
  `phone` string, 
  `kokura_id` bigint, 
  `blborrow` boolean, 
  `bldefective` boolean, 
  `blsell` boolean, 
  `blgift` boolean, 
  `storetype` int
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_store';