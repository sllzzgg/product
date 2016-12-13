use dw_shop;
CREATE EXTERNAL TABLE IF NOT EXISTS DW_BASIC_Shop_Products(
ProductId bigint,
ProductName string,
ProductCode string,
CategoryId int,
CategoryName string,
TypeId int,
TypeName string,
BrandId int,
BrandName string,
SupplierId int,
SupplierName string,
RegionId int,
RegionName string,
DepotId int,
Longitude double,
Latitude double,
AddedDate timestamp,
UpdatedDate timestamp,
salestatus    int,
salestatussub   int
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/dw_shop/DW_BASIC_Shop_Products';

INSERT  OVERWRITE TABLE DW_BASIC_Shop_Products
SELECT 
 t1.ProductId,
 t1.ProductName,
 t1.ProductCode,
 t7.CategoryId,
 t2.Name,
 t1.TypeId,
 t3.TypeName,
 t1.BrandId,
 t4.BrandName,
 t1.SupplierId,
 t5.Name,
 t1.RegionId,
 t6.RegionName,
 t6.DepotId,
 t6.Longitude,
 t6.Latitude,
 t1.AddedDate,
 t1.UpdatedDate,
 t1.salestatus ,
 t1.salestatussub 
From ods_shop.ODS_Shop_Products t1 
LEFT JOIN ods_shop.ODS_Shop_Categories t2  on  t1.CategoryId = t2.CategoryId
LEFT JOIN ods_shop.ODS_Shop_ProductTypes t3  on t1.TypeId = t3.TypeId
LEFT JOIN ods_shop.ODS_Shop_Brands t4 on t1.BrandId = t4.BrandId
LEFT JOIN ods_shop.ODS_Shop_Suppliers t5 on t1.SupplierId = t5.SupplierId
LEFT JOIN ods_shop.ODS_Shop_RegionDepot t6 on t1.RegionId = t6.RegionID
LEFT JOIN ods_shop.ODS_Shop_ProductCategories t7 on t7.productId = t1.productId;