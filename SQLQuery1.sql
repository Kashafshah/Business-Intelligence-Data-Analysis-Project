CREATE VIEW Trend_Growth_Analysis AS
SELECT 
    d.CalendarYear, 
    p.EnglishProductName, 
    SUM(s.SalesAmount) AS TotalSalesAmount, 
    COUNT(DISTINCT s.CustomerKey) AS UniqueCustomers, 
    COUNT(DISTINCT s.OrderDateKey) AS UniqueOrders,
    AVG(s.SalesAmount) AS AverageSalesAmount,
    MIN(s.SalesAmount) AS MinimumSalesAmount,
    MAX(s.SalesAmount) AS MaximumSalesAmount,
    YEAR(MAX(s.TransactionDate)) AS LatestYearOfSales,
    YEAR(MIN(s.TransactionDate)) AS EarliestYearOfSales
FROM 
    FactInternetSales s
    JOIN DimProduct p ON s.ProductKey = p.ProductKey
    JOIN DimDate d ON s.OrderDateKey = d.DateKey
GROUP BY 
    d.CalendarYear, 
    p.EnglishProductName
