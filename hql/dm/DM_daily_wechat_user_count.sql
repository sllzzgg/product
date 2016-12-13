INSERT INTO dm_shop.DM_daily_WeChat_user_count
	partition(dt='${hivevar:dtime}')
	SELECT
	createDate,
	addQuantity,
	cancelQuantity,
	SUM(
	   CASE
	   WHEN Status = 1 THEN
	   addQuantity  
	 END) OVER( sort by createDate )
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
	 WHERE createDate = '${hivevar:dtime}'
	  GROUP BY createDate,Status) t;
