CREATE EXTERNAL TABLE if not exists dm_shop.DM_daily_Account_user_statis(
createDate date,
totalCount  int,
registerCount  int,
freeze_count  int,
activateCount  int,
regionCityId int ,
SourceType  int
)
partitioned by(dt string )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dm_shop/DM_daily_Account_user_statis';

CREATE EXTERNAL TABLE IF NOT EXISTS dm_shop.DM_daily_supplier_orders(
orderdate date,
totalQuantity int,
totalAmount decimal(15,4),
supplierid int,
supplierName string
)PARTITIONED BY (dt string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dm_shop/DM_daily_supplier_orders';

CREATE EXTERNAL TABLE IF NOT EXISTS dm_shop.DM_daily_shop_category(
orderdate date,
supercategoryid int,
supercategoryname string,
DepotId int,
ordercount int,
orderamount decimal(15,4)
)PARTITIONED BY (dt string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dm_shop/DM_daily_shop_category';

CREATE EXTERNAL TABLE IF NOT EXISTS dm_shop.DM_daily_shop_brand(
orderdate date,
BrandId int,
BrandName string,
DepotId int,
ordercount int,
orderamount decimal(15,4)
)PARTITIONED BY (dt string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dm_shop/DM_daily_shop_brand';

CREATE EXTERNAL TABLE IF NOT EXISTS dm_shop.DM_daily_shop_orders_count(
orderdate date,
orderQuantity int,
orderAmount decimal(15,4),
cancelOrderQuantity int,
cancelOrderAmount decimal(15,4),
backOrderQuantity int,
backOrderAmount decimal(15,4),
returnOrderQuantity int,
returnOrderAmount decimal(15,4),
depotid int
)PARTITIONED BY (dt string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dm_shop/DM_daily_shop_orders_count';

CREATE EXTERNAL TABLE IF NOT EXISTS dm_shop.DM_daily_shop_orders_source(
orderdate date,
orderQuantity int,
orderAmount decimal(15,4),
ReferType int,
RegionId int,
RegionName string,
RegionCityId int,
RegionCity string,
Longitude double,
Latitude double
)PARTITIONED BY (dt string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dm_shop/DM_daily_shop_orders_source';

CREATE EXTERNAL TABLE IF NOT EXISTS dm_shop.DM_daily_shop_products(
orderdate date,
sku string,
productName string,
totalQuantity int,
sellPrice decimal(15,4),
totalAmount decimal(15,4),
depotId int
)PARTITIONED BY (dt string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dm_shop/DM_daily_shop_products';

CREATE EXTERNAL TABLE IF NOT EXISTS dm_shop.DM_daily_shop_products_flow(
orderdate date,
sku string,
productName string,
brandid int,
brandName string,
totalQuantity int,
sellPrice decimal(15,4),
totalAmount decimal(15,4),
productQuantity int,
depotId int,
regionCityId int,
regionCity string
)PARTITIONED BY (dt string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dm_shop/DM_daily_shop_products_flow';

CREATE EXTERNAL TABLE IF NOT EXISTS dm_shop.`DM_daily_Shop_Products_statis`(
addDate date,
depotId int,
purchaseCateName string, 
categoryName string,    
onlineQuantity int ,
lackQuantity int,
stopQuantity int
)PARTITIONED BY (dt string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dm_shop/DM_daily_Shop_Products_statis';

CREATE EXTERNAL TABLE IF NOT EXISTS dm_shop.DM_daily_shop_supplier_statis(
dateCreate date,
supplierName string,
userQuantity int,
activityUser int,
supplierId int,
orderQuantity int,
orderAmount double
)PARTITIONED BY(dt string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dm_shop/DM_daily_shop_supplier_statis';

CREATE EXTERNAL TABLE if not exists dm_shop.DM_daily_WeChat_user_count(
 createDate date,
 addQuantity int,
 cancelQuantity int,
 totalQuantity int
)partitioned by(dt string )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dm_shop/DM_daily_WeChat_user_count';