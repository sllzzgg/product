set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nostrick;
set hive.exec.max.dynamic.partitions.pernode=1000;

INSERT INTO dm_shop.DM_daily_shop_supplier_statis
PARTITION(dt)
SELECT
t1.dateCreate ,
t2.name,
t1.count_users,
t3.activity_users,
t2.supplierId,
t3.order_count,
t3.order_total ,
dateCreate as dt
from  (select supplierId,count(userId) count_users,dateCreate from dw_shop.DW_Basic_Accounts_Users 
 group by supplierId,dateCreate
   ) t1 
join ods_shop.ODS_Shop_Suppliers t2
on t1.supplierId = t2.supplierId
Left join 
  (select  count(distinct(buyerId)) activity_users ,
    count(1) order_count,
	sum(OrderTotal) order_total,supplierId,orderdate
  from dw_shop.DW_shop_orders 
  group by supplierId, orderdate) t3
on t3.supplierId = t2.SupplierId and t3.orderdate = t1.dateCreate