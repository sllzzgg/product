INSERT INTO dm_shop.DM_daily_shop_supplier_statis
PARTITION(dt='${hivevar:dtime}')
SELECT
t1.dateCreate ,
t2.name,
t1.count_users,
t3.activity_users,
t2.supplierId,
t3.order_count,
t3.order_total
from  (select supplierId,count(userId) count_users,dateCreate from dw_shop.DW_Basic_Accounts_Users 
where dateCreate = '${hivevar:dtime}'
group by supplierId,dateCreate
 ) t1 
join ods_shop.ODS_Shop_Suppliers t2
on t1.supplierId = t2.supplierId
Left join (
select count(distinct(buyerId)) activity_users ,count(1) order_count,sum(OrderTotal) order_total,supplierId
from dw_shop.DW_shop_orders 
where orderdate = '${hivevar:dtime}' 
group by supplierId
) t3
on t3.supplierId = t2.SupplierId