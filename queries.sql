-- 1. Display all employees
SELECT * FROM Employee;

-- 2. Display all customers in Branch 101
SELECT * FROM Customers WHERE Branch_id = 101;

-- 3. Show account details where balance is greater than 50,000
SELECT * FROM Account WHERE Acc_Balance > 50000;

-- 4. List all loans with amount less than 5 lakhs
SELECT * FROM Loans WHERE Loan_Amount < 500000;

-- 5. Show all transactions done using 'Cash'
SELECT * FROM Transaction WHERE Transaction_mode = 'Cash';

-- 6. Show employee names along with their branch name
SELECT e.Employee_name, b.Branch_name
FROM Employee e
JOIN Branch b ON e.Branch_id = b.Branch_id;

-- 7. List all customers and their account numbers
SELECT c.Customer_name, a.Bank_acc_no
FROM Customer c
JOIN Account a ON c.Customer_id = a.Customer_id;

-- 8. Show all transactions with customer name and account type
SELECT t.Transaction_id, c.Customer_name, a.Account_type, t.Amount, t.Transaction_date
FROM Transaction t
JOIN Customer c ON t.Cust_id = c.Customer_id
JOIN Account a ON t.Account_id = a.Account_id;

-- 9. Find total number of customers in each branch
SELECT b.Branch_name, COUNT(c.Customer_id) AS Total_Customers
FROM Branch b
LEFT JOIN Customer c ON b.Branch_id = c.Branch_id
GROUP BY b.Branch_name;

-- 10. Calculate total balance of all accounts branch-wise
SELECT b.Branch_name, SUM(a.Acc_Balance) AS Total_Balance
FROM Branch b
JOIN Account a ON b.Branch_id = a.Branch_id
GROUP BY b.Branch_name;

-- 11. Find the customer who has taken the maximum loan
SELECT Customer_name, Loan_amount
FROM Customer c
JOIN Loan l ON c.Customer_id = l.Customer_id
WHERE l.Loan_amount = (SELECT MAX(Loan_amount) FROM Loan);

-- 12. Show customers who don’t have any account
SELECT c.Customer_name
FROM Customer c
WHERE c.Customer_id NOT IN (SELECT Customer_id FROM Account);

-- 13. Find employees who earn more than the average salary
SELECT Employee_name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

-- 14. Show branch with the highest number of accounts
SELECT b.Branch_name, COUNT(a.Account_id) AS Total_Accounts
FROM Branch b
JOIN Account a ON b.Branch_id = a.Branch_id
GROUP BY b.Branch_name
ORDER BY Total_Accounts DESC
FETCH FIRST 1 ROWS ONLY;

-- 15. Show customers who did transactions of more than 1 lakh
SELECT DISTINCT c.Customer_name, t.Amount
FROM Customer c
JOIN Transaction t ON c.Customer_id = t.Cust_id
WHERE t.Amount > 100000;

-- 16. Find total loan amount taken by each branch
SELECT b.Branch_name, SUM(l.Loan_amount) AS Total_Loan
FROM Branch b
JOIN Customers c ON b.Branch_id = c.Branch_id
JOIN Loans l ON c.Cust_id = l.Cust_id
GROUP BY b.Branch_name;

-- 17. Increase salary of employees in branch 101 by 10%
UPDATE Employee
SET Salary = Salary * 1.10
WHERE Branch_id = 101;

-- 18. Delete all accounts with zero balance
DELETE FROM Account WHERE Acc_Balance = 0;

-- 19. Change all transactions done by ‘Cheque’ to ‘Cash’
UPDATE Transaction
SET Transaction_mode = 'Cash'
WHERE Transaction_mode = 'Cheque';

-- 20. Find average account balance of each account type
SELECT Account_type, AVG(Acc_Balance) AS Avg_Balance
FROM Account
GROUP BY Account_type;

