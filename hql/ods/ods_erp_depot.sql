CREATE EXTERNAL TABLE IF NOT EXISTS ods_shop.`ODS_ERP_Depot`(
  `depotid` int,
  `name` string,
  `code` string,
  `regionid` int,
  `address` string,
  `contactname` string,
  `phone` string,
  `email` string,
  `status` int,
  `helpcode` string,
  `createddate` string,
  `latitude` double,
  `longitude` double,
  `type` int,
  `remark` string
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_ERP_Depot';
