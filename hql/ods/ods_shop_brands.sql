CREATE EXTERNAL TABLE if not exists ods_shop.ODS_Shop_Brands(
	brandid                 int,
	brandname               string,
	brandspell              string,
	meta_description        string,
	meta_keywords           string,
	logo                    string,
	companyurl              string,
	description             string,
	displaysequence         int,
	theme                   string,
	recommend               int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_Shop_Brands';