set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nostrick;
set hive.exec.max.dynamic.partitions.pernode=1000;

INSERT INTO dm_shop.DM_daily_shop_products
PARTITION(dt)
SELECT
 t1.orderdate,
 t1.sku,
 t1.name,
 sum(t1.ShipmentQuantity),
 t1.SellPrice,
 sum(t1.SellPrice * t1.ShipmentQuantity) as total_price,
 t1.depotid,
 t1.orderdate
FROM   dw_shop.dw_shop_items t1 
group by t1.orderdate , t1.sku,t1.name,t1.SellPrice,t1.depotid;