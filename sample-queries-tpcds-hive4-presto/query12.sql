-- start query 1 in stream 0 using template query12.tpl and seed 345591136
with result as (
select  i_item_desc 
      ,i_category 
      ,i_class 
      ,i_current_price
      ,i_item_id
      ,sum(ws_ext_sales_price) as itemrevenue 
      ,sum(ws_ext_sales_price)*100/sum(sum(ws_ext_sales_price)) over
          (partition by i_class) as revenueratio
from	
	web_sales
    	,item 
    	,date_dim
where 
	ws_item_sk = i_item_sk 
  	and i_category in ('Jewelry', 'Sports', 'Books')
  	and ws_sold_date_sk = d_date_sk
    AND (CAST("d_date" AS DATE) BETWEEN CAST('2001-01-12' AS DATE) AND (CAST('2001-01-12' AS DATE) + INTERVAL  '30' DAY))
group by 
	i_item_id
        ,i_item_desc 
        ,i_category
        ,i_class
        ,i_current_price
order by 
	i_category
        ,i_class
        ,i_item_id
        ,i_item_desc
        ,revenueratio)
select i_item_desc ,i_category ,i_class ,i_current_price ,i_item_id, itemrevenue, revenueratio
from result
where itemrevenue >= 120700.0 * 1.5;

-- end query 1 in stream 0 using template query12.tpl
