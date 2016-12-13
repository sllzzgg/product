CREATE EXTERNAL TABLE IF NOT EXISTS dw_shop.DW_Shop_Categories(
  `categoryid` int, 
  `name` string, 
  `displaysequence` int, 
  `meta_title` string, 
  `meta_description` string, 
  `meta_keywords` string, 
  `description` string, 
  `parentcategoryid` int,
  `parentcategoryname` string,
  `supercategoryid` int, 
  `supercategoryname` string,
  `depth` int, 
  `path` string, 
  `rewritename` string, 
  `skuprefix` string, 
  `associatedproducttype` int, 
  `imageurl` string, 
  `notes1` string, 
  `notes2` string, 
  `notes3` string, 
  `notes4` string, 
  `notes5` string, 
  `theme` string, 
  `haschildren` boolean, 
  `seourl` string, 
  `seoimagealt` string, 
  `seoimagetitle` string, 
  `status` boolean
  )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dw_shop/DW_Shop_Categories';
 
 
INSERT OVERWRITE TABLE dw_shop.DW_Shop_Categories
SELECT
  t3.`categoryid` , 
  t3.`name`  , 
  t3.`displaysequence` , 
  t3.`meta_title`  , 
  t3.`meta_description`  , 
  t3.`meta_keywords`  , 
  t3.`description`  , 
  t2.`parentcategoryid` ,
  t2.`name` as parentcategoryname  ,
  t1.`categoryid` as supercategoryid , 
  t1.`name` as supercategoryname ,
  t3.`depth` , 
  t3.`path`  , 
  t3.`rewritename`  , 
  t3.`skuprefix`  , 
  t3.`associatedproducttype` , 
  t3.`imageurl`  , 
  t3.`notes1`  , 
  t3.`notes2`  , 
  t3.`notes3`  , 
  t3.`notes4`  , 
  t3.`notes5`  , 
  t3.`theme`  , 
  t3.`haschildren` boolean, 
  t3.`seourl`  , 
  t3.`seoimagealt`  , 
  t3.`seoimagetitle`  , 
  t3.`status` boolean
  FROM ods_shop.ODS_Shop_Categories t3
LEFT JOIN  ods_shop.ODS_Shop_Categories  t2 on t2.categoryid=t3.parentcategoryid
LEFT JOIN  ods_shop.ODS_Shop_Categories  t1 on t1.categoryid=split(t3.path,"\\|")[0];