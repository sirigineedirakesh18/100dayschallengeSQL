select * from viewership
select device_type,SUM(viewership_count) as total_views from viewership group by device_type
/*

Question:
Write a query that calculates the total viewership for laptops and mobile devices, 
where mobile is defined as the sum of tablet and phone viewership. Output the total 
viewership for laptops as laptop_views and the total viewership for mobile devices as mobile_views.

*/

select  SUM(case when device_type='laptop' then viewership_count else 0  end) as laptop_views,
		SUM(case when device_type='phone' then viewership_count when device_type='tablet' then viewership_count  else 0 end) as mobile_views
		from viewership 