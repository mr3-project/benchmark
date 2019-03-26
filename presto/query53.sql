SELECT *
FROM
  (
   SELECT
     "i_manufact_id"
   , "sum"("ss_sales_price") "sum_sales"
   , "avg"("sum"("ss_sales_price")) OVER (PARTITION BY "i_manufact_id") "avg_quarterly_sales"
   FROM
     item
   , store_sales
   , date_dim
   , store
   WHERE ("ss_item_sk" = "i_item_sk")
      AND ("ss_sold_date_sk" = "d_date_sk")
      AND ("ss_store_sk" = "s_store_sk")
      AND ("d_month_seq" IN (1212   , (1212 + 1)   , (1212 + 2)   , (1212 + 3)   , (1212 + 4)   , (1212 + 5)   , (1212 + 6)   , (1212 + 7)   , (1212 + 8)   , (1212 + 9)   , (1212 + 10)   , (1212 + 11)))
      AND ((("i_category" IN ('Books'         , 'Children'         , 'Electronics'))
            AND ("i_class" IN ('personal'         , 'portable'         , 'reference'         , 'self-help'))
            AND ("i_brand" IN ('scholaramalgamalg #14'         , 'scholaramalgamalg #7'         , 'exportiunivamalg #9'         , 'scholaramalgamalg #9')))
         OR (("i_category" IN ('Women'         , 'Music'         , 'Men'))
            AND ("i_class" IN ('accessories'         , 'classical'         , 'fragrances'         , 'pants'))
            AND ("i_brand" IN ('amalgimporto #1'         , 'edu packscholar #1'         , 'exportiimporto #1'         , 'importoamalg #1'))))
   GROUP BY "i_manufact_id", "d_qoy"
)  tmp1
WHERE ((CASE WHEN ("avg_quarterly_sales" > 0) THEN ("abs"((CAST("sum_sales" AS DECIMAL(38,4)) - "avg_quarterly_sales")) / "avg_quarterly_sales") ELSE null END) > DECIMAL '0.1')
ORDER BY "avg_quarterly_sales" ASC, "sum_sales" ASC, "i_manufact_id" ASC
LIMIT 100
;