SELECT 
    FORMAT(trans_date, 'yyyy-MM') AS monthnames,
    country,
    COUNT(id) AS total_transactions,
    SUM(amount) AS total_amount,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_transactions,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_amount
FROM Transactions
GROUP BY FORMAT(trans_date, 'yyyy-MM'), country
ORDER BY FORMAT(trans_date, 'yyyy-MM'), country;
