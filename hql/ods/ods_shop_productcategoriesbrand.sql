CREATE EXTERNAL TABLE if not exists ods_shop.ods_shop_ProductCategoriesBrand(
  categoryid    int,
  brandid        int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_Shop_ProductCategoriesBrand';
