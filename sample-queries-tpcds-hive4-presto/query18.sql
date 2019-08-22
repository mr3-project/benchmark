-- start query 1 in stream 0 using template query18.tpl and seed 1978355063
with result as (
select  i_item_id,
        ca_country,
        ca_state, 
        ca_county,
        avg( cast(cs_quantity as DECIMAL(12,2))) agg1,
        avg( cast(cs_list_price as DECIMAL(12,2))) agg2,
        avg( cast(cs_coupon_amt as DECIMAL(12,2))) agg3,
        avg( cast(cs_sales_price as DECIMAL(12,2))) agg4,
        avg( cast(cs_net_profit as DECIMAL(12,2))) agg5,
        avg( cast(c_birth_year as DECIMAL(12,2))) agg6,
        avg( cast(cd1.cd_dep_count as DECIMAL(12,2))) agg7
 from catalog_sales, customer_demographics cd1, 
      customer_demographics cd2, customer, customer_address, date_dim, item
 where cs_sold_date_sk = d_date_sk and
       cs_item_sk = i_item_sk and
       cs_bill_cdemo_sk = cd1.cd_demo_sk and
       cs_bill_customer_sk = c_customer_sk and
       cd1.cd_gender = 'M' and 
       cd1.cd_education_status = 'College' and
       c_current_cdemo_sk = cd2.cd_demo_sk and
       c_current_addr_sk = ca_address_sk and
       c_birth_month in (9,5,12,4,1,10) and
       d_year = 2001 and
       ca_state in ('ND','WI','AL' ,'NC','OK','MS','TN')
 group by rollup (i_item_id, ca_country, ca_state, ca_county)
 order by ca_country,
        ca_state, 
        ca_county,
	i_item_id)
select  i_item_id,
        ca_country,
        ca_state, 
        ca_county,
        agg1,
        agg2,
        agg3,
        agg4,
        agg5,
        agg6,
        agg7
from result
where agg1 >= 50.0 and agg2 >= 101.0 and agg3 >= 192.0 and agg4 >= 63.0 and agg6 >= 1954.0 and agg7 >= 4.3;

-- end query 1 in stream 0 using template query18.tpl
