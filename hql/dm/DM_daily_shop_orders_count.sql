INSERT INTO dm_shop.DM_daily_shop_orders_count
PARTITION(dt='${hivevar:dtime}')
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
 t1.depotId
FROM dw_shop.dw_shop_orders t1 left join 
(select * from ods_shop.ods_shop_returnorders  where to_date(`createddate`)='${hivevar:dtime}') t2  
on t1.orderid = t2.orderid
where t1.orderdate='${hivevar:dtime}'
group by t1.orderdate, t1.depotId;