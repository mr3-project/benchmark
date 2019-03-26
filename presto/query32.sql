SELECT "sum"("cs_ext_discount_amt") "excess discount amount"
FROM
  catalog_sales
, item
, date_dim
WHERE ("i_manufact_id" = 269)
   AND ("i_item_sk" = "cs_item_sk")
   AND (CAST("d_date" AS DATE) BETWEEN CAST('1998-03-18' AS DATE) AND (CAST('1998-03-18' AS DATE) + INTERVAL  '90' DAY))
   AND ("d_date_sk" = "cs_sold_date_sk")
   AND ("cs_ext_discount_amt" > (
      SELECT (DECIMAL '1.3' * "avg"("cs_ext_discount_amt"))
      FROM
        catalog_sales
      , date_dim
      WHERE ("cs_item_sk" = "i_item_sk")
         AND (CAST("d_date" AS DATE) BETWEEN CAST('1998-03-18' AS DATE) AND (CAST('1998-03-18' AS DATE) + INTERVAL  '90' DAY))
         AND ("d_date_sk" = "cs_sold_date_sk")
   ))
LIMIT 100
;
