CREATE EXTERNAL TABLE if not exists ods_shop.ODS_Shop_ProductTypes(
typeid    int,
typename   string,
remark string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_Shop_ProductTypes';
