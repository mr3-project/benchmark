SELECT
  "avg"("ss_quantity")
, "avg"("ss_ext_sales_price")
, "avg"("ss_ext_wholesale_cost")
, "sum"("ss_ext_wholesale_cost")
FROM
  store_sales
, store
, customer_demographics
, household_demographics
, customer_address
, date_dim
WHERE ("s_store_sk" = "ss_store_sk")
   AND ("ss_sold_date_sk" = "d_date_sk")
   AND ("d_year" = 2001)
   AND ((("ss_hdemo_sk" = "hd_demo_sk")
         AND ("cd_demo_sk" = "ss_cdemo_sk")
         AND ("cd_marital_status" = 'M')
         AND ("cd_education_status" = '4 yr Degree')
         AND ("ss_sales_price" BETWEEN DECIMAL '100.00' AND DECIMAL '150.00')
         AND ("hd_dep_count" = 3))
      OR (("ss_hdemo_sk" = "hd_demo_sk")
         AND ("cd_demo_sk" = "ss_cdemo_sk")
         AND ("cd_marital_status" = 'D')
         AND ("cd_education_status" = 'Primary')
         AND ("ss_sales_price" BETWEEN DECIMAL '50.00' AND DECIMAL '100.00')
         AND ("hd_dep_count" = 1))
      OR (("ss_hdemo_sk" = "hd_demo_sk")
         AND ("cd_demo_sk" = "ss_cdemo_sk")
         AND ("cd_marital_status" = 'U')
         AND ("cd_education_status" = 'Advanced Degree')
         AND ("ss_sales_price" BETWEEN DECIMAL '150.00' AND DECIMAL '200.00')
         AND ("hd_dep_count" = 1)))
   AND ((("ss_addr_sk" = "ca_address_sk")
         AND ("ca_country" = 'United States')
         AND ("ca_state" IN ('KY'      , 'GA'      , 'NM'))
         AND ("ss_net_profit" BETWEEN 100 AND 200))
      OR (("ss_addr_sk" = "ca_address_sk")
         AND ("ca_country" = 'United States')
         AND ("ca_state" IN ('MT'      , 'OR'      , 'IN'))
         AND ("ss_net_profit" BETWEEN 150 AND 300))
      OR (("ss_addr_sk" = "ca_address_sk")
         AND ("ca_country" = 'United States')
         AND ("ca_state" IN ('WI'      , 'MO'      , 'WV'))
         AND ("ss_net_profit" BETWEEN 50 AND 250)))
;
