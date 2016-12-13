set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nostrick;
set hive.exec.max.dynamic.partitions.pernode=1000;

INSERT INTO dm_shop.DM_daily_Account_user_statis
partition(dt)
select
datecreate,
sum(register) over(partition by regionid order by datecreate) total, 
register, 
freeze,
activate,
regionid,
SourceType,
datecreate as dt
FROM (select count(1) register,
 count(case
 when activity = false then
  1
 end) freeze,
 count(case
  when activity = true then
   1
  end) activate,
regionid,
SourceType,
datecreate
from dw_shop.dw_basic_accounts_users
group by datecreate, regionid,SourceType) t ;