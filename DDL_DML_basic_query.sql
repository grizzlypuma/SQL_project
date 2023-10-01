	/* Below are the tables: salesman, customer, orders
	SALESMAN
		salesmanid	name			city		commission
		5001		James Hoog		New York	0.15
		5002		Nail Knite		Paris		0.13
		5005		Pit Alex		London		0.11
		5006		Mc Lyon			Paris		0.14
		5003		Lauson Hen		San Jose	0.12
		5007		Paul Adam		Rome		0.13
	
	CUSTOMER
		customerid	custname		city		grade	salesman id
		3002		Nick Rimando	New York	100		5001
		3007		Brad Davis		New York	200		5001
		3005		Graham zusi		California	200		5002
		3008		Julian Green	London		300		5002
		3004		Fabian Johnson	Paris		300		5006
		3009		Geoff Cameron	Berlin		100		5003
		3003		Joz Altidor		Moscow		200		5007
	
	ORDERS

		Old_no	purch_amt	ord_date	CustomerID	SalesmanID
		70001	150.5		10/5/2012	3005		5002
		70009	270.65		9/10/2012	3001		5005
		70002	65.26		10/5/2012	3002		5001	
		70004	110.5		8/17/2012	3009		5003
		70007	948.5		9/10/2012	3005		5002
		70005	2400.6		7/27/2012	3007		5001
		70008	5760		9/10/2012	3002		5001
	*/

--- Write a query to display all clients with a grade above 100.

select 
  * 
from 
  Customer 
where 
  grade > 100

--- Write a query to display all customers in New York who have a grade greater than 100.

select 
  * 
from 
  Customer 
where 
  grade > 100 
  and city = 'New York'

--- Write a query to display all customers who are either from New York or have a grade above 100.

select 
  * 
from 
  Customer 
where 
  grade > 100 
  or city = 'New York'

--- Write a query to display all customers who are either from New York or do not have a grade above 100.

select 
  * 
from 
  Customer 
where 
  grade <= 100 
  and city <> 'New York'

--- Write a query to display either those orders that were not released on the date 2012-09-10 and were issued by a seller whose ID is 5005 and below, 
--- or those orders whose purchase amount is 1000.00 and below.

select 
  * 
from 
  Orders 
where 
  (
    ord_date <> '2012-09-10' 
    and salesman_id <= 5005
  ) 
  OR purch_amt <= 1000

--- Write a query to display the salesman_id, name, city and 
--- commission of those salespeople who receive a commission ranging from 0.10% to 0.12%.
select 
  salesman_id, 
  name, 
  city, 
  commission 
from 
  Salesman 
where 
  commission between 0.10 
  and 0.12

--- Write a query to display all orders where the purchase amount is less than 200 and at least 1 of the following conditions are met: the order date 
--- is not earlier than August 17, 2012 or the customer ID is below 3009.

select 
  * 
from 
  Orders 
where 
  purch_amt < 200 
  and (
    ord_date >= '2012-08-17' 
    or customer_id < 3009
  )

--- Write a query to display rows that satisfy at least 1 of the conditions: 1) order date 2012-08-17 and purchase amount greater than 200 2) customer ID 
--- greater than 3005 and purchase amount less than 1000.

select 
  * 
from 
  Orders 
where 
  (
    ord_date = '2012-08-17' 
    and purch_amt > 200
  ) 
  or (
    customer_id > 3005 
    and purch_amt < 1000
  )
--- Write an SQL query to display the order number, purchase amount that reached 50% of the target value of 6000, 
--- and also indicate what % of the goal (6000) was met.
select 
  ord_no, 
  purch_amt, 
  round(
    (purch_amt * 100)/ 6000, 
    2
  ) as KPI 
from 
  Orders 
where 
  purch_amt >= 3000
--- Write a query to find data for clients named Nick.
select 
  * 
from 
  Customer 
where 
  cust_name like 'Nick %'
--- Write a query to find customer data with first and last names that do not contain the letter F.
select 
  * 
from 
  Customer 
where 
  cust_name not like '%F%'
