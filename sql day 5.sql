select * from transactions;
/*
-- UBER DATA ANALYST INTERVIEW QUESTION
Question:
Write a SQL query to obtain the third transaction of every user. 
Output the user id, spend, and transaction date.

*/

with cte as(
select *,ROW_NUMBER() over(partition by user_id  order by transaction_id) as partitions_user from transactions)
select USER_ID,spend,transaction_date from cte where partitions_user=3

CREATE TABLE product_revenue (
    product_name VARCHAR(255),
    year INTEGER,
    revenue DECIMAL(10, 2)
);

-- Insert sample records
INSERT INTO product_revenue (product_name, year, revenue) VALUES
('Product A', 2022, 10000.00),
('Product A', 2023, 9500.00),
('Product B', 2022, 15000.00),
('Product B', 2023, 14500.00),
('Product C', 2022, 8000.00),
('Product C', 2023, 8500.00),
('Product D', 2022, 12000.00),
('Product D', 2023, 12500.00),
('Product E', 2022, 20000.00),
('Product E', 2023, 19000.00),
('Product F', 2022, 7000.00),
('Product F', 2023, 7200.00),
('Product G', 2022, 18000.00),
('Product G', 2023, 17000.00),
('Product H', 2022, 3000.00),
('Product H', 2023, 3200.00),
('Product I', 2022, 9000.00),
('Product I', 2023, 9200.00),
('Product J', 2022, 6000.00),
('Product J', 2023, 5900.00);

/*Find the top 5 products whose revenue has decreased in comparison to the 
previous year (both 2022 and 2023). Return the product name, 
revenue for the previous year, revenue for the current year, 
revenue decreased, and the decreased ratio (percentage).*/

select * from product_revenue

with cte as(
select *, LEAD(revenue) over(partition by product_name order by year) as leading_trail from product_revenue),
cte2 as(
select *, leading_trail-revenue as profit from cte)
select TOP 5 product_name, revenue as revenue_previous_year,leading_trail as revenue_current_year,cast((profit/revenue*100) as decimal(10,2)) as  loss_percent from cte2 where profit<0 
order by profit asc