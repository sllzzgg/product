INSERT INTO dm_shop.DM_daily_shop_products
PARTITION(dt='${hivevar:dtime}')
SELECT
 t1.orderdate,
 t1.sku,
 t1.name,
 sum(t1.ShipmentQuantity),
 t1.SellPrice,
 sum(t1.SellPrice * t1.ShipmentQuantity) as total_price,
 t1.depotid
FROM   dw_shop.dw_shop_items t1 where t1.`orderdate`='${hivevar:dtime}'
group by t1.orderdate , t1.sku,t1.name,t1.SellPrice,t1.depotid;