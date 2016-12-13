set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nostrick;
set hive.exec.max.dynamic.partitions.pernode=1000;

INSERT INTO dm_shop.DM_daily_shop_orders_source
PARTITION(dt)
SELECT
orderdate ,
COUNT(orderid) orderQuantity ,
SUM(OrderTotal) orderAmount ,
ReferType ,
Regionid,
Regionname,
RegionCityId ,
RegionCity,
Longitude,
Latitude,
orderdate as dt
FROM dw_shop.dw_shop_orders
GROUP BY orderdate,ReferType,Regionid,
 Regionname,regionCityId,RegionCity,Longitude,Latitude;