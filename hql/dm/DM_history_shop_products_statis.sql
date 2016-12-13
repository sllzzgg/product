set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nostrick;
set hive.exec.max.dynamic.partitions.pernode=1000;

INSERT INTO dm_shop.DM_daily_Shop_Products_statis
PARTITION(dt)
SELECT 
to_date(t1.addeddate) d,
t1.depotId,
CASE WHEN t2.parentcategoryname is null
THEN
 t2.name 
ELSE 
t2.parentcategoryname 
END as parentcategoryname ,
t2.name,
SUM(
 CASE WHEN t1.SaleStatus=1 
 THEN 
   1
 ELSE 
   0 
 END  
),
SUM(
 CASE WHEN t1.SaleStatus=0 AND  SaleStatusSub=1
 THEN 
   1
 ELSE 
   0
 END  
),
SUM(
 CASE WHEN t1.SaleStatus=0 AND  SaleStatusSub=2
 THEN 
   1
 ELSE 
   0  
 END  
),
to_date(t1.addeddate)
FROM dw_shop.DW_BASIC_Shop_Products t1 JOIN dw_shop.DW_Shop_Categories t2
ON (t1.CategoryId = t2.CategoryId)
GROUP BY to_date(t1.addeddate),t1.depotId, t2.parentcategoryname ,t2.name ;
