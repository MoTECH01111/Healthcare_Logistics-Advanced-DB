USE Healthcare_Distribution;

-- Collecting Information about the usage supply.
SELECT O.date, S.supply, H.location, C.equipment, M.used
FROM Merchandise M
JOIN Order_Calender O ON M.date_Ref = O.date_Ref
JOIN Supplies S ON M.supply_Ref = S.supply_Ref
JOIN ChainLocation C ON M.order_Ref = C.order_Ref
JOIN Hospital_Region H ON C.order_Ref = H.order_Ref
ORDER BY O.date;

