USE Healthcare_Distribution;

-- Collecting Information about highest supply used 
SELECT S.supply, C.location, M.used
FROM Merchandise M
JOIN Supplies S ON M.supply_Ref = S.supply_Ref
JOIN ChainLocation C ON M.order_Ref = C.order_Ref
ORDER BY M.used DESC;
