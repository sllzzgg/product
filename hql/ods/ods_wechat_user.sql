CREATE EXTERNAL TABLE IF NOT EXISTS ods_shop.`ODS_WeChat_User`(
  `id` int, 
  `userid` int, 
  `groupid` int, 
  `openid` string, 
  `username` string, 
  `nickname` string, 
  `sex` int, 
  `city` string, 
  `province` string, 
  `country` string, 
  `language` string, 
  `headimgurl` string, 
  `createtime` string, 
  `status` int, 
  `canceltime` string, 
  `remark` string, 
  `lastmsgtime` string
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_WeChat_User';