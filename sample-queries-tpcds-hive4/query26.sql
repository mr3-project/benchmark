-- start query 1 in stream 0 using template query26.tpl and seed 1930872976
with result as(
select  i_item_id, 
        avg(cs_quantity) agg1,
        avg(cs_list_price) agg2,
        avg(cs_coupon_amt) agg3,
        avg(cs_sales_price) agg4 
 from catalog_sales, customer_demographics, date_dim, item, promotion
 where cs_sold_date_sk = d_date_sk and
       cs_item_sk = i_item_sk and
       cs_bill_cdemo_sk = cd_demo_sk and
       cs_promo_sk = p_promo_sk and
       cd_gender = 'F' and 
       cd_marital_status = 'W' and
       cd_education_status = 'Primary' and
       (p_channel_email = 'N' or p_channel_event = 'N') and
       d_year = 1998 
 group by i_item_id
 order by i_item_id
)
select  i_item_id, 
        agg1,
        agg2,
        agg3,
        agg4 
from result
where agg1 >= 50.0 and agg2 >= 118.0 and agg3 >= 80.0 and agg4 >= 38.0;

-- end query 1 in stream 0 using template query26.tpl
