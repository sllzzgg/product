use ods_shop;
CREATE EXTERNAL TABLE if not exists ODS_Shop_RegionDepot(
regionid                int,
depotid                 int,
regionname              string,
status                  boolean,                                   
path                    string,
depth                   int,
displaysequence         int,
isdefault               boolean,                                     
parentid                int,
id                      int,
longitude               double,
latitude                double
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_Shop_RegionDepot'; 