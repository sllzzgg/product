CREATE EXTERNAL TABLE IF NOT EXISTS ODS_shop.ODS_Shop_DepotSKUs_57(
 SkuId bigint,
 ProductId bigint,
 SKU string,
 Weight string,
 Stock int,
 AlertStock int,
 CostPrice decimal(15,4),
 MarketPrice decimal(15,4),
 SalePrice decimal(15,4),
 Upselling boolean,
 SaleStatusSub int,
 RestrictionCount int,
 PurchaseCount int,
 LastUpDate timestamp,
 LastDownDate timestamp,
 CreatedDate timestamp,
 UpdatedDate timestamp,
 DayBuy int
 )ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_Shop_DepotSKUs_57';  