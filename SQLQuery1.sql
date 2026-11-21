CREATE DATABASE PROJECT;



USE PROJECT
USE master

select * from sales

--1 Category wise sales and profit.
select Category , sum(Sales) as 'totalsales',sum(Profit) as 'total_profit' from sales group by Category 

--2 top 5 product by profit
select top 5  Product , sum(Profit) as 'proft' from sales group by Product order by proft desc

--3 monthly sales trend 
select Year , Month , sum(Sales) as 'sales' from sales group by Year , Month order by Year asc ,month asc

--4 region by loss
select Region ,sum(Profit) as 'loss' from sales group by Region having sum(Profit) < 0

-- 5 Window Function: RANK() OVER (PARTITION Region ORDER BY Sales DESC).
SELECT
    Region,
    Product,
    Sales,
    RANK() OVER (
        PARTITION BY Region
        ORDER BY Sales DESC
    ) AS Sales_Rank
FROM sales;


