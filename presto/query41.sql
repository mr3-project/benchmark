SELECT DISTINCT "i_product_name"
FROM
  item i1
WHERE ("i_manufact_id" BETWEEN 742 AND (742 + 40))
   AND ((
      SELECT "count"(*) "item_cnt"
      FROM
        item
      WHERE (("i_manufact" = "i1"."i_manufact")
            AND ((("i_category" = 'Women')
                  AND (("i_color" = 'orchid')
                     OR ("i_color" = 'papaya'))
                  AND (("i_units" = 'Pound')
                     OR ("i_units" = 'Lb'))
                  AND (("i_size" = 'petite')
                     OR ("i_size" = 'medium')))
               OR (("i_category" = 'Women')
                  AND (("i_color" = 'burlywood')
                     OR ("i_color" = 'navy'))
                  AND (("i_units" = 'Bundle')
                     OR ("i_units" = 'Each'))
                  AND (("i_size" = 'N/A')
                     OR ("i_size" = 'extra large')))
               OR (("i_category" = 'Men')
                  AND (("i_color" = 'bisque')
                     OR ("i_color" = 'azure'))
                  AND (("i_units" = 'N/A')
                     OR ("i_units" = 'Tsp'))
                  AND (("i_size" = 'small')
                     OR ("i_size" = 'large')))
               OR (("i_category" = 'Men')
                  AND (("i_color" = 'chocolate')
                     OR ("i_color" = 'cornflower'))
                  AND (("i_units" = 'Bunch')
                     OR ("i_units" = 'Gross'))
                  AND (("i_size" = 'petite')
                     OR ("i_size" = 'medium')))))
         OR (("i_manufact" = "i1"."i_manufact")
            AND ((("i_category" = 'Women')
                  AND (("i_color" = 'salmon')
                     OR ("i_color" = 'midnight'))
                  AND (("i_units" = 'Oz')
                     OR ("i_units" = 'Box'))
                  AND (("i_size" = 'petite')
                     OR ("i_size" = 'medium')))
               OR (("i_category" = 'Women')
                  AND (("i_color" = 'snow')
                     OR ("i_color" = 'steel'))
                  AND (("i_units" = 'Carton')
                     OR ("i_units" = 'Tbl'))
                  AND (("i_size" = 'N/A')
                     OR ("i_size" = 'extra large')))
               OR (("i_category" = 'Men')
                  AND (("i_color" = 'purple')
                     OR ("i_color" = 'gainsboro'))
                  AND (("i_units" = 'Dram')
                     OR ("i_units" = 'Unknown'))
                  AND (("i_size" = 'small')
                     OR ("i_size" = 'large')))
               OR (("i_category" = 'Men')
                  AND (("i_color" = 'metallic')
                     OR ("i_color" = 'forest'))
                  AND (("i_units" = 'Gram')
                     OR ("i_units" = 'Ounce'))
                  AND (("i_size" = 'petite')
                     OR ("i_size" = 'medium')))))
   ) > 0)
ORDER BY "i_product_name" ASC
LIMIT 100
;
