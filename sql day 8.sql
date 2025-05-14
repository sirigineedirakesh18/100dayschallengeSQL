select * from tweets
/*
	
Question:
Write a query to obtain a histogram of tweets posted per user in 2022. 
Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.

*/
with cte as(
select user_id, COUNT(USER_ID) as tweet_count_per_user from tweets where YEAR(tweet_date)=2022 group by user_id)
select tweet_count_per_user,COUNT(user_id) as users from cte group by tweet_count_per_user