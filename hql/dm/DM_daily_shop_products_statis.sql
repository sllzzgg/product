INSERT INTO dm_shop.DM_daily_Shop_Products_statis
PARTITION(dt='${hivevar:dtime}')
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
)
FROM  
(select addeddate,depotId,SaleStatus,CategoryId,SaleStatusSub
  from dw_shop.DW_BASIC_Shop_Products 
  where to_date(addeddate)='${hivevar:dtime}') t1 
JOIN dw_shop.DW_Shop_Categories t2
ON (t1.CategoryId = t2.CategoryId)
GROUP BY to_date(t1.addeddate),t1.depotId, t2.parentcategoryname ,t2.name ;
