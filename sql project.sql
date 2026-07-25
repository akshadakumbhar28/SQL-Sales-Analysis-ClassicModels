use classicmodels;
select * from customers;
select * from orders;
select * from orderdetails;
select * from products;
select * from payments;

-- 1️ Basic Analysis Questions

-- Find the total number of customers in the database.
select count(*) from customers;

-- Show all customers from USA.
select * from customers
where country = 'USA';

-- Find the top 5 customers with the highest credit limit.
select * from customers
order by creditlimit desc
limit 5;

-- Display the number of customers in each country.
select country,count(customernumber) as total_cut 
from customers
group by country;

-- Find customers whose credit limit is greater than 50,000.
select * from customers
where creditlimit > 50000;

-- 2.Order Analysis Questions
select * from orders;

-- Find the total number of orders placed.
select count(ordernumber) from orders;

-- Show the number of orders placed by each customer.
select customernumber,count(ordernumber) as total
from orders
group by customernumber;

-- Find the latest order date in the dataset.
select max(orderdate) as latest_order from orders;

-- Display customers who have not placed any orders.
select customernumber from customers
left join orders
using(customernumber)
where ordernumber is null;

-- Find the top 5 customers with the highest number of orders.
select customernumber,count(ordernumber) total_order from customers
inner join orders
using(customernumber)
group by customernumber
order by total_order desc
limit 5;

-- 3.Sales Analysis Questions

-- Calculate the total revenue generated.
select sum(quantityordered * priceeach) total_sale
from orderdetails;

-- Find the total sales for each product.
select productname,sum(quantityordered * priceeach) total_sale
from orderdetails
inner join products
using(productcode)
group by productname;

-- Find the top 10 best-selling products.
select productname, sum(quantityordered * priceeach) total_sale 
from products
inner join orderdetails
using(productcode)
group by productname
order by total_sale desc
limit 10;

-- Calculate total sales by product line.
select productline,sum(quantityordered * priceeach) total_sale
from orderdetails
inner join products
using(productcode)
group by productline;

-- Find the average product price.
select avg(buyprice) from products;

-- 4.JOIN Practice Questions (Very Important for Interviews)

-- Display customer name and order number.
select customername,ordernumber from customers
inner join orders
using(customernumber);

-- Show product name and quantity ordered.
select productname,quantityordered from orderdetails
join products
using(productcode);

-- Find total sales by each customer.
select customername, sum(quantityordered * priceeach) total_sale 
from customers
inner join orders
using(customernumber)
inner join orderdetails
using (ordernumber)
group by customername
order by total_sale desc;

-- Display customer name, order number, and product ordered.
select customername,ordernumber,pr

-- Find customers who made payments greater than 100000.









