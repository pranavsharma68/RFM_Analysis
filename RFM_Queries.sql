select * from `sql-powerbi-rfm-analysis.Sales.rfm-202512`;

alter table `sql-powerbi-rfm-analysis.Sales.rfm-202512`
drop column string_field_5,
drop column string_field_6,
drop column string_field_7;

-- step 1: append all monthly sales tables together

create or replace table `sql-powerbi-rfm-analysis.Sales.Sales_2025` AS   
select * from `sql-powerbi-rfm-analysis.Sales.rfm-202501`
UNION ALL select * from `sql-powerbi-rfm-analysis.Sales.rfm-202502`
UNION ALL select * from `sql-powerbi-rfm-analysis.Sales.rfm-202503`
UNION ALL select * from `sql-powerbi-rfm-analysis.Sales.rfm-202504`
UNION ALL select * from `sql-powerbi-rfm-analysis.Sales.rfm-202505`
UNION ALL select * from `sql-powerbi-rfm-analysis.Sales.rfm-202506`
UNION ALL select * from `sql-powerbi-rfm-analysis.Sales.rfm-202507`
UNION ALL select * from `sql-powerbi-rfm-analysis.Sales.rfm-202508`
UNION ALL select * from `sql-powerbi-rfm-analysis.Sales.rfm-202509`
UNION ALL select * from `sql-powerbi-rfm-analysis.Sales.rfm-202510`
UNION ALL select * from `sql-powerbi-rfm-analysis.Sales.rfm-202511`
UNION ALL select * from `sql-powerbi-rfm-analysis.Sales.rfm-202512`;

-- Step2 : calculate Recency, Frequency, Monetary, r, f, m ranks

-- combining views , CTEs

create or replace view `sql-powerbi-rfm-analysis.Sales.rfm_metrics` AS   

  with CURRENT_DATE AS 
  (
     select DATE('2026-04-08') as Analysis_Date
  ),
rfm AS (
   select
    CustomerID,
    max(OrderDate) as MaxOrders,
    DATE_DIFF((Select Analysis_Date from CURRENT_DATE), max(OrderDate), Day) AS  Recency,
        count(*) AS  Frequency,
        sum(OrderValue) as Monetary
  from `sql-powerbi-rfm-analysis.Sales.Sales_2025`
  group by CustomerID

)

select
  rfm.*,
  row_number() over(order by Recency asc) AS r_rank,
  row_number() over(order by Frequency desc) AS f_rank,
  row_number() over(order by Monetary desc) AS m_rank
from rfm;


-- step3: Assign desciles (10 = best, 1= worst)


CREATE OR REPLACE VIEW `sql-powerbi-rfm-analysis.Sales.rfm_scores`

AS
SELECT 
  *,
  NTILE(10) OVER(order by r_rank DESC) as r_score,
  NTILE(10) OVER(order by f_rank DESC) as f_score,
  NTILE(10) OVER(order by m_rank DESC) as m_score
FROM `sql-powerbi-rfm-analysis.Sales.rfm_metrics`;



-- step 4: total score

CREATE OR REPLACE VIEW `sql-powerbi-rfm-analysis.Sales.rfm_total_scores`
AS
select
  CustomerID,
  recency, 
  frequency,
  monetary,
  r_score,
  f_score,
  m_score,
  (r_score + f_score + m_score) as rfm_total_score

from `sql-powerbi-rfm-analysis.Sales.rfm_scores`

order by rfm_total_score desc;


-- step 5: Bi ready rfm segments table

CREATE OR REPLACE TABLE `sql-powerbi-rfm-analysis.Sales.rfm_segments_final`
AS
SELECT 
  CustomerID,
  recency, 
  frequency,
  monetary,
  r_score,
  f_score,
  m_score,
  rfm_total_score,
  CASE 
    WHEN rfm_total_score >= 28 THEN 'Champions' -- 28-30
    WHEN rfm_total_score >= 24 THEN 'Loyal VIPs' -- 28-30
    WHEN rfm_total_score >= 20 THEN 'Potential Loyalists' -- 28-30
    WHEN rfm_total_score >= 16 THEN 'Promising' -- 28-30
    WHEN rfm_total_score >= 12 THEN 'Engaged' -- 28-30
    WHEN rfm_total_score >= 8 THEN 'Requires Attention' -- 28-30
    WHEN rfm_total_score >= 4 THEN 'At Risk'-- 28-30
    ELSE 'Lost/Inactive'
  END AS rfm_Segment

from `sql-powerbi-rfm-analysis.Sales.rfm_total_scores`

order by rfm_total_score desc;






