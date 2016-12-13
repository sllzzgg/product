INSERT INTO dm_shop.DM_daily_Account_user_statis
partition(dt ='${hivevar:dtime}')
select
datecreate,
sum(register) over(partition by regionid order by datecreate) total, 
register, 
freeze,
activate,
regionid,
SourceType
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
where datecreate = '${hivevar:dtime}'
group by datecreate, regionid,SourceType) t ;