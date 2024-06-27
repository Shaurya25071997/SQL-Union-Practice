use practice1

select * from salesman
select * from customer
select * from orders

--------From the following tables, write a SQL query to find all salespeople and customers located in the city of London.-----------

select salesman_id, name from salesman where city = 'London'
UNION

(select customer_id, cust_name from customer where city = 'London')

------ From the following tables, write a SQL query to find distinct salespeople and their cities. Return salesperson ID and city.-------


select salesman_id, city from customer 

UNION

(select salesman_id, city from salesman)

----From the following tables, write a SQL query to find all those salespeople and customers who are involved in the inventory management system. Return salesperson ID, customer ID.-------------

select salesman_id, customer_id from orders 

UNION

(select salesman_id, customer_id from customer)


-----From the following table, write a SQL query to find the salespersons who generated the largest and smallest orders on each date. Return salesperson ID, name, order no., highest on/lowest on, order date.----

select a.salesman_id, name, ord_no, 'highest_no', ord_date from salesman a, orders b where a.salesman_id = b.salesman_id and b.purch_amt = 

(select max(purch_amt) from orders c where c.ord_date = b.ord_date)

UNION

select a.salesman_id, name, ord_no, 'lowest_no', ord_date from salesman a, orders b where a.salesman_id = b.salesman_id and b.purch_amt = 

(select min(purch_amt) from orders c where c.ord_date = b.ord_date)

---------From the following tables, write a SQL query to find the salespeople who generated the largest and smallest orders on each date. Sort the result-set on third field. Return salesperson ID, name, order no., highest on/lowest on, order date.---------


select a.salesman_id, name, ord_no, 'highest_on', ord_date from salesman a, orders b where a.salesman_id = b.salesman_id and b.purch_amt = 

(select max(purch_amt) from orders c where c.ord_date = b.ord_date)

UNION

select a.salesman_id, name, ord_no, 'lowest_on', ord_date from salesman a, orders b where a.salesman_id = b.salesman_id and b.purch_amt = 

(select min(purch_amt) from orders c where c.ord_date = b.ord_date) 

Order by 3


---From the following tables, write a SQL query to find those salespeople who live in the same city where the customer lives as well as those who do not have customers in their cities by indicating 'NO MATCH'. Sort the result set on 2nd column (i.e. name) in descending order. Return salesperson ID, name, customer name, commission---


select salesman.salesman_id, name, cust_name, commission from salesman, customer where salesman.city = customer.city

UNION

select salesman_id, name, 'Not_MATCH', commission from salesman where NOT city = ANY (select city from customer) Order by 2 desc;


---From the following tables, write a SQL query that appends strings to the selected fields, indicating whether the city of any salesperson is matched with the city of any customer. Return salesperson ID, name, city, MATCHED/NO MATCH.


select a.salesman_id, name, a.city, 'MATCHED' from salesman a , customer b where a.city = b.city

UNION

select salesman_id, name, city, 'NO_MATCH' from salesman where not city = any (select city from customer) order by 2 desc;


----From the following table, write a SQL query to create a union of two queries that shows the customer id, cities, and ratings of all customers. Those with a rating of 300 or greater will have the words 'High Rating', while the others will have the words 'Low Rating'.--------


select customer_id, city, grade, 'High_Rating'  from customer where grade >= 300

UNION

select customer_id, city, grade, 'Low_Rating'  from customer where grade < 300

-----------From the following table, write a SQL query to find those salespersons and customers who have placed more than one order. Return ID, name.----


select customer_id as 'ID', cust_name as 'name' from customer a where 1 < (select count(*) from orders b where a.customer_id = b.customer_id)

UNION

select salesman_id as 'ID', name as 'name' from salesman a where 1 < (select count(*) from orders b where a.salesman_id = b.salesman_id) order by 2;

