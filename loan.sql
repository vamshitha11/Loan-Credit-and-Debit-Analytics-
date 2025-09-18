create database cre;
use cre;
select * from debit;


-- Total Credit
SELECT SUM(CASE WHEN transaction_type = 'Credit' THEN amount END) AS Total_Credit
FROM debit;

-- Total Debit
SELECT SUM(CASE WHEN transaction_type = 'Debit' THEN amount END) AS Total_Debit
FROM debit;

-- CR to DEBT Ratio
SELECT 
    SUM(CASE WHEN transaction_type = 'Credit' THEN amount END) /
    SUM(CASE WHEN transaction_type = 'Debit' THEN amount END) AS CR_to_DEBT_Ratio
FROM debit;

-- Net Transactions
SELECT COUNT(Customer_ID) AS Net_Transactions
FROM debit;

-- Transaction by Month
select mon_th as month, sum(amount) as "Transaction"
from debit
group by mon_th
order by  mon_th;

-- Transaction by Day
select day_1 as day, sum(amount) as "Transaction"
from debit
group by day_1
order by day_1;

-- Transaction by Bank
select sum(amount) as "Transaction", Bank_Name
from debit

group by Bank_Name;

-- Transaction by Branch
select sum(amount) as "Transaction", branch
from debit
group by branch;

-- Transaction Method Distribution
select sum(amount) as "Transaction", Transaction_Method
from debit
group by Transaction_Method;

-- Transaction Type (High Risk vs Normal)
select sum(amount) as "Transaction", Risk_Transaction
from debit
group by Risk_Transaction;

