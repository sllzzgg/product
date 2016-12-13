use dw_shop;
CREATE EXTERNAL TABLE if not exists DW_Wide_Shop_RegionDepot(
regionid                int,
depotid                 int,
regionname              string,
status                  boolean,                                   
path                    string,
depth                   int,
displaysequence         int,
isdefault               boolean,                                     
parentid                int,
parentName              string ,
id                      int ,
longitude               double,
latitude                double,
regionCityId            int,
regionCity              string,
regionProvinceId        int,
regionProvince          string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dw_shop/DW_Wide_Shop_RegionDepot'; 

INSERT overwrite TABLE dw_shop.DW_Wide_Shop_RegionDepot
SELECT
t3.regionid,
t3.depotid ,       
t3.regionname, 
t3.status ,
t3.path ,
t3.depth ,
t3.displaysequence ,
t3.isdefault  ,
t3.parentid  ,
t1.regionname,
t3.id        ,
t3.longitude ,
t3.latitude  ,
t1.regionid as regionCityId,
t1.regionname as city,
t2.regionid as regionProvinceId,
t2.regionname as province
FROM ods_shop.ODS_Shop_RegionDepot t3
LEFT JOIN  ods_shop.ODS_Shop_RegionDepot  t1 on t1.regionId=split(t3.path,",")[2]
LEFT JOIN  ods_shop.ODS_Shop_RegionDepot  t2 on t2.regionId=split(t3.path,",")[1];


