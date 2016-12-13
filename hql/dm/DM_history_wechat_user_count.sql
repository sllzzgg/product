set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nostrick;
set hive.exec.max.dynamic.partitions.pernode=1000;

INSERT INTO dm_shop.DM_daily_WeChat_user_count
partition(dt)
SELECT
createDate,
addQuantity,
cancelQuantity,
SUM(
   CASE
   WHEN Status = 1 THEN
   addQuantity  
 END) OVER( sort by createDate ),
 createDate as dt
FROM 
(SELECT 
 createDate,
 Status,
  SUM(
    CASE 
    WHEN Status = 1 THEN
    1 
    END) addQuantity,
  SUM(
   CASE 
   WHEN Status = 0 THEN
   1 
 END) cancelQuantity
 FROM dw_shop.DW_Basic_WeChat_Users
 GROUP BY createDate,Status) t;
