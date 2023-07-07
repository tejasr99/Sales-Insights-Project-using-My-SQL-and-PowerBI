use sales;

select * from customers;
select * from date;
select * from markets;
select * from products;
select * from transactions;

select count(*) from transactions;

select * from transactions
where market_code = 'Mark001';

select * from transactions
where currency = 'usd';

-- Total Transactions occured particular year (2020)
select year, sum(t.sales_amount) from transactions t
inner join 
date d
on t.order_date = d.date
group by year;

-- Total sales amount in Chennai region
select m.markets_name, sum(t.sales_amount) from transactions t
inner join 
markets m
on t.market_code = m.markets_code
where markets_name = 'Chennai';

select * from transactions
where sales_amount <=0;

select distinct currency from transactions;

-- INR
-- 'INR\r'
-- 'USD'
-- 'USD\r'

select count(currency) from transactions
where currency = 'INR\r';

select count(currency) from transactions
where currency = 'INR';

select * from transactions
where currency = 'USD' or currency = 'USD\r';

Select Distinct sales_amount from transactions;

-- Sales amount for particular month
select d.year, d.month_name ,sum(t.sales_amount) from transactions t
inner join 
date d
on t.order_date = d.date
group by year, month_name;

-- Show transactions in 2020 join by date table.
SELECT transactions.*, date.* FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
where date.year=2020;

-- Show total revenue in year 2020.
SELECT SUM(t.sales_amount) FROM transactions t 
INNER JOIN date d
ON t.order_date=d.date 
where d.year=2020 and t.currency="INR\r";

-- Show total revenue in year 2020, January Month.
SELECT SUM(t.sales_amount) FROM transactions t 
INNER JOIN date d 
ON t.order_date=d.date 
where d.year=2020 and d.month_name="January";

-- Show total revenue in year 2020 in Chennai.
SELECT SUM(t.sales_amount) FROM transactions t 
INNER JOIN date d 
ON t.order_date=d.date 
where d.year=2020 and t.market_code="Mark001";