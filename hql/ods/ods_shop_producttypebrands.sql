CREATE EXTERNAL TABLE if not exists ods_shop.ODS_Shop_ProductTypeBrands(
ProductTypeId    int,
BrandId   string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_Shop_ProductTypeBrands';
