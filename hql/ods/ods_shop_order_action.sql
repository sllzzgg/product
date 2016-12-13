CREATE EXTERNAL TABLE IF NOT EXISTS ods_shop.ODS_Shop_Order_Action(
ActionId  bigint ,
OrderId  bigint ,
OrderCode string,
UserId  int,
Username  string,
ActionCode  string,
ActionDate  decimal(15,4),
Remark  string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_Shop_Order_Action';

