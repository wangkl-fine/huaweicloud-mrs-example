-- start query HetuEngine Q032.sql
select  sum(cs_ext_discount_amt)  as "excess discount amount" 
from 
   catalog_sales 
   ,item 
   ,date_dim
where
i_manufact_id = 66
and i_item_sk = cs_item_sk 
and d_date between '2002-03-29'
           and CAST((CAST('2002-03-29' AS DATE) + INTERVAL '90' DAY) AS VARCHAR)
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
          and d_date between '2002-03-29'
                     and CAST((CAST('2002-03-29' AS DATE) + INTERVAL '90' DAY) AS VARCHAR)
          and d_date_sk = cs_sold_date_sk 
      ) 
limit 100;
-- end query HetuEngine Q032.sql
