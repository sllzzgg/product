set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nostrick;
set hive.exec.max.dynamic.partitions.pernode=1000;

INSERT INTO dm_shop.DM_daily_supplier_orders
PARTITION(dt)
SELECT 
  orderdate,
  sum(orderid),
  sum(ordertotal),
  supplierid,
  supplierName,
  orderdate as dt
FROM dw_shop.dw_shop_orders 
GROUP BY orderdate,supplierid,supplierName;


