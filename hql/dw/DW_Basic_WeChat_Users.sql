CREATE EXTERNAL TABLE IF NOT EXISTS dw_shop.`DW_Basic_WeChat_Users`(
  dateCreate  Date,
  userid int, 
  username string, 
  nickname string, 
  truename string, 
  sex string, 
  phone string, 
  email string,
  NativePlace string,
  regionId int,
  Address string,
  SourceType int,
  LastAccessTime  timestamp,
  LastAccessIP  string,
  LastLoginTime timestamp,
  LineId int,
  LineName string,
  SupplierId int ,
  SuplierName string,
  Activity boolean,
  groupid int , 
  openid  int , 
  WeiXinUsername string , 
  WeiXinNickname string , 
  WeiXinSex int , 
  city  string, 
  province string , 
  country string , 
  language  string, 
  headimgurl string , 
  createtime timestamp ,
  createDate date,
  status int , 
  canceltime timestamp ,
  canceldate date,  
  remark string , 
  lastmsgtime timestamp 
 )ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' 
LOCATION '/opt/data/hive/dw_shop/DW_Basic_WeChat_Users';


INSERT OVERWRITE TABLE dw_shop.DW_Basic_WeChat_Users
SELECT
  t1.User_dateCreate,
  t1.UserId,
  t1.UserName,
  t1.NickName,
  t1.TrueName,
  t1.Sex,
  t1.Phone,
  t1.Email,
  t2.NativePlace,
  t2.RegionId,
  t2.Address,
  t2.SourceType,
  t2.LastAccessTime,
  t2.LastAccessIP,
  t2.LastLoginTime,
  t4.LineId,
  t4.LineName,
  t5.SupplierId,
  t5.Name,
  t1.Activity,
  t6.groupid,
  t6.openid,
  t6.username,
  t6.nickname,
  t6.sex,
  t6.city,
  t6.province,
  t6.country,
  t6.language,
  t6.headimgurl,
  t6.createtime,
  to_date(t6.createtime),
  t6.status,
  t6.canceltime,
  to_date(t6.canceltime),
  t6.remark,
  t6.lastmsgtime
FROM ods_shop.ODS_Accounts_Users  t1 INNER JOIN ods_shop.ODS_Accounts_Usersexp t2
on t1.UserId = t2.UserId
LEFT JOIN ods_shop.ODS_Shop_ShippingAddress t3 ON t1.UserID = t3.UserId
LEFT JOIN ods_shop.ODS_ERP_Lines t4 ON t4.LineId = t3.LineId
LEFT JOIN ods_shop.ODS_Shop_Suppliers t5 ON t5.SupplierId = t4.SupplierId
RIGHT JOIN ods_shop.ODS_WeChat_User t6 ON t1.UserID = t6.UserID;


  
  
  