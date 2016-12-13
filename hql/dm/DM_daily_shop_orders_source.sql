INSERT INTO dm_shop.DM_daily_shop_orders_source
PARTITION(dt='${hivevar:dtime}')
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
Latitude
FROM dw_shop.dw_shop_orders 
WHERE orderdate = '${hivevar:dtime}'
GROUP BY orderdate,ReferType,Regionid,
 Regionname,regionCityId,RegionCity,Longitude,Latitude;