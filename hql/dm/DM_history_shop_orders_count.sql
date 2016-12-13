set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nostrick;
set hive.exec.max.dynamic.partitions.pernode=1000;

INSERT INTO dm_shop.DM_daily_shop_orders_count
PARTITION(dt)
SELECT
t1.orderdate ,
COUNT(1)orderQuantity  ,    
SUM(t1.OrderTotal)orderAmount   ,
  COUNT(CASE 
  WHEN OrderStatus = -1  THEN
   1
 END) cancelOrderQuantity ,
 SUM(CASE 
   WHEN t1.OrderStatus = -1 THEN
   OrderTotal
 END) cancelOrderAmount ,
 COUNT(t2.orderid) backOrderQuantity,
 SUM(t2.AmountActual) backOrderAmount,
 COUNT(t2.orderid) backOrderQuantity,
 SUM(t2.AmountAdjusted) backOrderAmount,
 t1.depotId,
 t1.orderdate
FROM dw_shop.dw_shop_orders t1 left join 
(select * from ods_shop.ods_shop_returnorders ) t2  
on t1.orderid = t2.orderid
group by t1.orderdate, t1.depotId;