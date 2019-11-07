-- start query 1 in stream 0 using template query35.tpl and seed 1930872976
with result as (
select   
  ca_state,
  cd_gender,
  cd_marital_status,
  count(*) cnt1,
  avg(cd_dep_count) cd_dep_count_avg,
  max(cd_dep_count) cd_dep_count_max,
  sum(cd_dep_count) cd_dep_count_sum,
  cd_dep_employed_count,
  count(*) cnt2,
  avg(cd_dep_employed_count) cd_dep_employed_count_avg,
  max(cd_dep_employed_count) cd_dep_employed_count_max,
  sum(cd_dep_employed_count) cd_dep_employed_count_sum,
  cd_dep_college_count,
  count(*) cnt3,
  avg(cd_dep_college_count) cd_dep_college_count_avg,
  max(cd_dep_college_count) cd_dep_college_count_max,
  sum(cd_dep_college_count) cd_dep_college_count_sum
 from
  customer c,customer_address ca,customer_demographics
 where
  c.c_current_addr_sk = ca.ca_address_sk and
  cd_demo_sk = c.c_current_cdemo_sk and 
  exists (select *
          from store_sales,date_dim
          where c.c_customer_sk = ss_customer_sk and
                ss_sold_date_sk = d_date_sk and
                d_year = 1999 and
                d_qoy < 4) and
   (exists (select *
            from web_sales,date_dim
            where c.c_customer_sk = ws_bill_customer_sk and
                  ws_sold_date_sk = d_date_sk and
                  d_year = 1999 and
                  d_qoy < 4) or 
    exists (select * 
            from catalog_sales,date_dim
            where c.c_customer_sk = cs_ship_customer_sk and
                  cs_sold_date_sk = d_date_sk and
                  d_year = 1999 and
                  d_qoy < 4))
 group by ca_state,
          cd_gender,
          cd_marital_status,
          cd_dep_count,
          cd_dep_employed_count,
          cd_dep_college_count
 order by ca_state,
          cd_gender,
          cd_marital_status,
          cd_dep_count,
          cd_dep_employed_count,
          cd_dep_college_count)
select   
  ca_state,
  cd_gender,
  cd_marital_status,
  cnt1,
  cd_dep_count_avg,
  cd_dep_count_max,
  cd_dep_count_sum,
  cd_dep_employed_count,
  cnt2,
  cd_dep_employed_count_avg,
  cd_dep_employed_count_max,
  cd_dep_employed_count_sum,
  cd_dep_college_count,
  cnt3,
  cd_dep_college_count_avg,
  cd_dep_college_count_max,
  cd_dep_college_count_sum
from
  result
where cd_dep_college_count_sum > 800;

-- end query 1 in stream 0 using template query35.tpl
