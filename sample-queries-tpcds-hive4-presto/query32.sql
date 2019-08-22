-- start query 1 in stream 0 using template query32.tpl and seed 2031708268
select  sum(cs_ext_discount_amt)  as "excess discount amount"
from 
   catalog_sales 
   ,item 
   ,date_dim
where
i_manufact_id = 269
and i_item_sk = cs_item_sk 
   AND (CAST("d_date" AS DATE) BETWEEN CAST('1998-03-18' AS DATE) AND (CAST('1998-03-18' AS DATE) + INTERVAL  '90' DAY))
and d_date_sk = cs_sold_date_sk 
and cs_ext_discount_amt  
     > ( 
         select 
            1.3 * avg(cs_ext_discount_amt) 
         from 
            catalog_sales 
           ,date_dim
         where 
              cs_item_sk = i_item_sk 
         AND (CAST("d_date" AS DATE) BETWEEN CAST('1998-03-18' AS DATE) AND (CAST('1998-03-18' AS DATE) + INTERVAL  '90' DAY))
          and d_date_sk = cs_sold_date_sk 
      );

-- end query 1 in stream 0 using template query32.tpl
