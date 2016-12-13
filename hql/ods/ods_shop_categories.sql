CREATE EXTERNAL TABLE if not exists ods_shop.ODS_Shop_Categories(
categoryid              int   ,
name                    string,
displaysequence         int   ,
meta_title              string,
meta_description        string,
meta_keywords           string,
description             string,
parentcategoryid        int   ,
depth                   int   ,
path                    string,
rewritename             string,
skuprefix               string,
associatedproducttype   int   ,
imageurl                string,
notes1                  string,
notes2                  string,
notes3                  string,
notes4                  string,
notes5                  string,
theme                   string,
haschildren             boolean,                                     
seourl                  string,
seoimagealt             string,
seoimagetitle           string,
status                  boolean
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_Shop_Categories';       