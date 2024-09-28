USE Healthcare_Distribution;

--  Collecting Information about the usage supply by region
SELECT H.region, S.supply, SUM(M.used) AS total_used
FROM Merchandise M
JOIN Supplies S ON M.supply_Ref = S.supply_Ref
JOIN ChainLocation C ON M.order_Ref = C.order_Ref
JOIN Hospital_Region H ON C.order_Ref = H.order_Ref
GROUP BY H.region, S.supply
ORDER BY H.region, total_used DESC;
