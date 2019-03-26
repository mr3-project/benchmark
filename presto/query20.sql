SELECT
  "i_item_id"
, "i_item_desc"
, "i_category"
, "i_class"
, "i_current_price"
, "sum"("cs_ext_sales_price") "itemrevenue"
, (("sum"("cs_ext_sales_price") * 100) / "sum"("sum"("cs_ext_sales_price")) OVER (PARTITION BY "i_class")) "revenueratio"
FROM
  catalog_sales
, item
, date_dim
WHERE ("cs_item_sk" = "i_item_sk")
   AND ("i_category" IN ('Jewelry', 'Sports', 'Books'))
   AND ("cs_sold_date_sk" = "d_date_sk")
   AND (CAST("d_date" AS DATE) BETWEEN CAST('2001-01-12' AS DATE) AND (CAST('2001-01-12' AS DATE) + INTERVAL  '30' DAY))
GROUP BY "i_item_id", "i_item_desc", "i_category", "i_class", "i_current_price"
ORDER BY "i_category" ASC, "i_class" ASC, "i_item_id" ASC, "i_item_desc" ASC, "revenueratio" ASC
LIMIT 100
;
