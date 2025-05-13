select * from product_spend;
/*
-- Amazon Interview question

Question:
Write a query to identify the top two highest-grossing products 
within each category in the year 2022. Output should include the category,
product, and total spend.

*/
with cte as(
select category,product,
DENSE_RANK() over(partition by category order by spend desc) as top2
from product_spend where YEAR(transaction_date)=2022)
select * from cte where top2<=2
