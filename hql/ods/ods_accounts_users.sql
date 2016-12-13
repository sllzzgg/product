CREATE EXTERNAL TABLE IF NOT EXISTS ods_shop.`ODS_Accounts_Users`(
  `userid` int, 
  `username` string, 
  `password` binary, 
  `nickname` string, 
  `truename` string, 
  `sex` string, 
  `phone` string, 
  `email` string, 
  `employeeid` int, 
  `departmentid` string, 
  `activity` boolean, 
  `usertype` string, 
  `style` int, 
  `user_icreator` int, 
  `user_datecreate` timestamp, 
  `user_datevalid` timestamp, 
  `user_dateexpire` timestamp, 
  `user_iapprover` int, 
  `user_dateapprove` timestamp, 
  `user_iapprovestate` int, 
  `user_clang` string
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' 
  LOCATION '/opt/data/hive/ods_shop/ODS_Accounts_Users';