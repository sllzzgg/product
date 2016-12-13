CREATE EXTERNAL TABLE IF NOT EXISTS ods_shop.`ODS_ERP_Lines`(
  `lineid` int, 
  `depotid` int, 
  `linename` string, 
  `sequence` int, 
  `regionid` int, 
  `address` string, 
  `status` int, 
  `createduserid` int, 
  `createddate` string, 
  `remark` string, 
  `supplierid` int
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_ERP_Lines';