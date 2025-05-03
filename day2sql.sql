/*
Question 1:
Write a SQL query to retrieve the IDs of the Facebook pages that have zero likes. 
The output should be sorted in ascending order based on the page IDs.
*/
select * from  pages
select * from page_likes
select * from events

select p.page_id from pages p left join page_likes pl
on p.page_id=pl.page_id group by p.page_id having count(liked_date)=0
order by p.page_id asc;


/*

Question 2: 
Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.
Definition and note:
Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
To avoid integer division, multiply the CTR by 100.0, not 100.
Expected Output Columns: app_id, ctr

*/
select app_id,cast(ROUND((100.0 * SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) / COUNT(*)), 2) AS decimal(10,2)) AS ctr
from events where YEAR(timestamp)=2022 group by app_id
