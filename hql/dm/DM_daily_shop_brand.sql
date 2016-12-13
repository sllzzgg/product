INSERT INTO dm_shop.DM_daily_shop_brand
PARTITION(dt='${hivevar:dtime}')
SELECT 
t1.orderdate,
t2.BrandId,
t2.BrandName,
t2.DepotId,
count(t4.orderid),
sum(t4.OrderTotal)
FROM (select orderdate,productid,orderid from dw_shop.dw_shop_items where orderdate='${hivevar:dtime}' ) t1
LEFT JOIN dw_shop.DW_BASIC_Shop_Products t2 ON (t1.productid = t2.productid)
LEFT JOIN (select orderid,orderTotal from dw_shop.dw_shop_orders where orderdate='${hivevar:dtime}') t4 
ON t4.orderid = t1.orderid 
group by  t2.BrandId,t2.BrandName,t2.DepotId, t1.orderdate;