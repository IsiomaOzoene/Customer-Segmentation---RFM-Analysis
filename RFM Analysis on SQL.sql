--Create Table--
CREATE TABLE customer_segmentation (
    InvoiceNo VARCHAR,
    StockCode VARCHAR,
    Description TEXT,
    Quantity INTEGER,
    InvoiceDate TIMESTAMP,
    UnitPrice NUMERIC,
    CustomerID BIGINT,
    Country VARCHAR
);

Select*
from cleaned_table


Create table cleaned_table as
SELECT *
    FROM customer_segmentation
    WHERE InvoiceNo NOT LIKE 'C%' AND CustomerID IS NOT NULL


-- Calculate total price / revenue
SELECT 
        CustomerID,
        InvoiceNo,
        InvoiceDate,
        Quantity,
        UnitPrice,
		Country,
        (Quantity * UnitPrice) AS TotalPrice
    FROM cleaned_table


-- Get latest date in dataset + 1 day for Recency reference
Create table Reference_Date AS
SELECT MAX(InvoiceDate) + INTERVAL '1 day' AS RefDate 
FROM cleaned_table 

-- RFM calculation
Create table RFM_Base AS 
SELECT c.CustomerID,
        MAX(c.InvoiceDate) AS LastPurchaseDate,
        COUNT(DISTINCT c.InvoiceNo) AS Frequency,
        SUM(Quantity * UnitPrice) AS Monetary,
		Max(Country) AS Country
    FROM cleaned_table c
    GROUP BY c.CustomerID

--Final RFM Table with recency--
create table RFM_Table as
Select
     r.CustomerID,
	 r.Country,
	 Extract(DAY FROM (rd.RefDate - r.LastPurchaseDate)) AS Recency,
	 r.Frequency,
	 r.Monetary
From RFM_Base r, Reference_Date rd
Order By r.CustomerID;

--Add RFM Score (Quantile-based)--
create table RFM_Score as 
select *,
ntile(5) over (order by Recency ASC) as R_Score,  --lower recency = better
ntile(5) over (order by Frequency DESC) as F_Score, --higer freq = better
ntile(5) over (order by Monetary DESC) as M_Score  --higher monetary = better
from RFM_Table;

--Customer_Segmentation
create view Customer_Segments as
select *,
  concat(R_Score, F_Score, M_Score) as RFM_Score,
  case
    when R_Score >= 4 and F_Score >= 4 and M_Score >= 4 then 'Champions'
    when R_Score >= 3 and F_Score >= 4 then 'Loyal Customers'
	When R_Score >= 3 and F_Score Between 2 and 3 Then 'Potential Customers'
	When M_Score >= 4 And F_Score <= 3 Then 'Big Spenders'
    When R_Score <= 2 and F_Score >= 3 and M_Score >= 3 Then 'At Risk'
	When R_Score <= 2 and F_Score <= 2 and M_Score <= 2 Then 'Sleeping'
	Else 'Others'
  End as Segment
from RFM_Score;

