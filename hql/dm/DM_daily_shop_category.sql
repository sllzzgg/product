INSERT INTO dm_shop.DM_daily_shop_category
PARTITION(dt='${hivevar:dtime}')
SELECT 
t1.orderdate,
t3.supercategoryid,
t3.supercategoryname,
t2.DepotId,
count(t4.orderid),
sum(t4.OrderTotal)
FROM (select orderdate,productid,orderid from dw_shop.dw_shop_items  where dt='${hivevar:dtime}') t1
LEFT JOIN dw_shop.DW_BASIC_Shop_Products t2 ON (t1.productid = t2.productid)
LEFT JOIN dw_shop.dw_shop_categories t3 ON (t2.CategoryId = t3.CategoryId)
LEFT JOIN (select orderid,orderTotal from dw_shop.dw_shop_orders where dt='${hivevar:dtime}' ) t4 
ON t4.orderid = t1.orderid 
group by  t3.supercategoryid,t3.supercategoryname ,t2.depotId,t1.orderdate;
