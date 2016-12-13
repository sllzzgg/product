CREATE EXTERNAL TABLE if not exists ods_shop.ODS_Shop_Suppliers(
supplierid              int   ,
name                    string,
shopname                string,
storestatus             int   ,
categoryid              int   ,
rank                    int   ,
userid                  int   ,
username                string,
telphone                string,
cellphone               string,
contactmail             string,
introduction            string,
registeredcapital       int   ,
regionid                int   ,
address                 string,
contact                 string,
establisheddate         timestamp,
establishedcity         int   ,
logo                    string,
fax                     string,
postcode                string,
homepage                string,
artiperson              string,
companytype             int   ,
businesslicense         string,
taxnumber               string,
accountbank             string,
accountinfo             string,
servicephone            string,
qq                      string,
msn                     string,
status                  int ,  
createddate             timestamp,
createduserid           int  , 
updateddate             timestamp,
updateduserid           int  , 
expirationdate          timestamp,
balance                 double,
isuserapprove           boolean ,                                    
issuppapprove           boolean,                                     
scoredesc               decimal(15,4),
scoreservice            decimal(15,4),
scorespeed              decimal(15,4),
recomend                int,   
sequence                int,   
productcount            int,   
photocount              int,   
themeid                 int,   
remark                  string,
agentid                 int ,  
indexprodtop            int ,  
indexcontent            string,
latitude                double,
longitude               double,
isinactive              boolean
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/opt/data/hive/ods_shop/ODS_Shop_Suppliers';                                     