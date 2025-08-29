-- BANKS
INSERT INTO Bank VALUES (1, 'State Bank of India', 'Mumbai');
INSERT INTO Bank VALUES (2, 'HDFC Bank', 'Mumbai');
INSERT INTO Bank VALUES (3, 'ICICI Bank', 'Delhi');

-- BRANCHES
INSERT INTO Branch VALUES (101, 'SBI Pune Main', 'Pune Camp', 'SBIN000101', 1);
INSERT INTO Branch VALUES (102, 'SBI Nashik Road', 'Nashik Road', 'SBIN000102', 1);
INSERT INTO Branch VALUES (201, 'HDFC Indira Nagar', 'Bangalore Indira Nagar', 'HDFC000201', 2);
INSERT INTO Branch VALUES (202, 'HDFC Connaught Place', 'Delhi CP', 'HDFC000202', 2);
INSERT INTO Branch VALUES (301, 'ICICI Andheri', 'Mumbai Andheri', 'ICICI000301', 3);

-- EMPLOYEES
INSERT INTO Employee VALUES (9001, 'Suresh Kumar', 'Manager', 'Pune', '9898989898', 75000, 101);
INSERT INTO Employee VALUES (9002, 'Anjali Singh', 'Clerk', 'Nashik', '9797979797', 35000, 102);
INSERT INTO Employee VALUES (9003, 'Rohan Deshmukh', 'Cashier', 'Bangalore', '9696969696', 40000, 201);
INSERT INTO Employee VALUES (9004, 'Meena Joshi', 'Loan Officer', 'Delhi', NULL, 50000, 202); -- contact missing
INSERT INTO Employee VALUES (9005, 'Arun Patel', 'Manager', 'Mumbai', '9595959595', 82000, 301);

-- CUSTOMERS
INSERT INTO Customers VALUES (1001, 'Abhishek Karande', '9876543210', 'Pune', 'abhi@gmail.com', '123412341234', 101);
INSERT INTO Customers VALUES (1002, 'Dnyanada Deshkar', '9123456789', 'Nashik', 'dnya@gmail.com', '567856785678', 102);
INSERT INTO Customers VALUES (1003, 'Aditi Karande', '9988776655', 'Bangalore', 'aditi@gmail.com', '789078907890', 201);
INSERT INTO Customers VALUES (1004, 'Ulka Karande', NULL, 'Delhi', 'ulka@gmail.com', '345634563456', 202); -- contact missing
INSERT INTO Customers VALUES (1005, 'Milind Karande', '9090909090', 'Mumbai', NULL, '456745674567', 301); -- email missing
INSERT INTO Customers VALUES (1006, 'Aarya Karande', '9111222233', 'Pune', 'aarya@gmail.com', NULL, 101); -- aadhaar missing

-- ACCOUNTS
INSERT INTO Account VALUES (5001, 'Savings', 'SBIN5001', 25000, 101, 1001);
INSERT INTO Account VALUES (5002, 'Current', 'SBIN5002', 100000, 102, 1002);
INSERT INTO Account VALUES (5003, 'Savings', 'HDFC5003', 45000, 201, 1003);
INSERT INTO Account VALUES (5004, 'Savings', 'HDFC5004', 0, 202, 1004); -- zero balance
INSERT INTO Account VALUES (5005, 'Current', 'ICICI5005', 8000, 301, 1005);
INSERT INTO Account VALUES (5006, 'FD', 'SBIN5006', 200000, 101, 1006);
INSERT INTO Account VALUES (5007, 'Savings', 'SBIN5007', DEFAULT, 101, 1001); -- default balance

-- LOANS
INSERT INTO Loan VALUES (7001, 'HOME', 1500000, '10 Years', 8.5, 101, 1001);
INSERT INTO Loan VALUES (7002, 'CAR', 600000, '5 Years', 9.0, 201, 1003);
INSERT INTO Loan VALUES (7003, 'PERSONAL', 250000, '3 Years', 11.0, 202, 1004);
INSERT INTO Loan VALUES (7004, 'EDUCATION', 400000, '4 Years', 10.5, 301, 1005);

-- TRANSACTIONS
INSERT INTO Transaction VALUES (8001, 1001, 5001, 'Deposit', 'Cash', 5000, SYSDATE-10);
INSERT INTO Transaction VALUES (8002, 1002, 5002, 'Withdrawal', 'ATM', 2000, SYSDATE-5);
INSERT INTO Transaction VALUES (8003, 1003, 5003, 'Transfer', 'UPI', 1500, SYSDATE-2);
INSERT INTO Transaction VALUES (8004, 1004, 5004, 'LoanPayment', 'NetBanking', 6000, SYSDATE-20);
INSERT INTO Transaction VALUES (8005, 1005, 5005, 'Deposit', 'Cheque', 10000, SYSDATE-15);


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--Tables and their data:-


-- BANK TABLE
SQL> select * from bank;

BANK_ID BANK_NAME                      HEAD_OFFICE_ADDRESS
------- ------------------------------ ------------------------------
      1 State Bank of India            Mumbai
      2 HDFC Bank                      Mumbai
      3 ICICI Bank                     Delhi



-- BRANCH TABLE
SQL> select * from branch;

BRANCH_ID BRANCH_NAME                    BRANCH_ADDRESS                 IFSC_CODE                      BANK_ID
--------- ------------------------------ ------------------------------ ------------------------------ -------
      101 SBI Pune Main                  Pune Camp                      SBIN000101                           1
      102 SBI Nashik Road                Nashik Road                    SBIN000102                           1
      201 HDFC Indira Nagar              Bangalore Indira Nagar         HDFC000201                           2
      202 HDFC Connaught Place           Delhi CP                       HDFC000202                           2
      301 ICICI Andheri                  Mumbai Andheri                 ICICI000301                          3



-- EMPLOYEE TABLE
SQL> select * from employees;

 EMP_ID EMP_NAME             EMP_POSITION                   EMP_ADDR                       EMP_CONTAC  SALARY BRANCH_ID
------- -------------------- ------------------------------ ------------------------------ ---------- ------- ---------
   9001 Suresh Kumar         Manager                        Pune                           9898989898   75000       101
   9002 Anjali Singh         Clerk                          Nashik                         9797979797   35000       102
   9003 Rohan Deshmukh       Cashier                        Bangalore                      9696969696   40000       201
   9004 Meena Joshi          Loan Officer                   Delhi                                       50000       202
   9005 Arun Patel           Manager                        Mumbai                         9595959595   82000       301



-- CUSTOMER TABLE
SQL> select * from customers;

CUST_ID CUST_NAME            CUST_CONTA CUST_ADDR  CUST_EMAIL           AADHAR_NO                      BRANCH_ID
------- -------------------- ---------- ---------- -------------------- ------------------------------ ---------
   1001 Abhishek Karande     9876543210 Pune       abhi@gmail.com       123412341234                         101
   1002 Dnyanada Deshkar     9123456789 Nashik     dnya@gmail.com       567856785678                         102
   1003 Aditi Karande        9988776655 Bangalore  aditi@gmail.com      789078907890                         201
   1004 Ulka Karande                    Delhi      ulka@gmail.com       345634563456                         202
   1005 Milind Karande       9090909090 Mumbai                          456745674567                         301
   1006 Aarya Karande        9111222233 Pune       aarya@gmail.com                                           101

6 rows selected.


-- ACCOUNT TABLE
SQL> select * from account;

ACCOUNT_ID ACCOUNT_TYPE         BANK_ACC_NO                        ACC_BALANCE BRANCH_ID                    CUSTOMER_ID
---------- -------------------- --------------- ------------------------------ --------- ------------------------------
      5001 Savings              SBIN5001                                 25000       101                           1001
      5002 Current              SBIN5002                                100000       102                           1002
      5003 Savings              HDFC5003                                 45000       201                           1003
      5004 Savings              HDFC5004                                     0       202                           1004
      5005 Current              ICICI5005                                 8000       301                           1005
      5006 FD                   SBIN5006                                200000       101                           1006
      5007 Savings              SBIN5007                                     0       101                           1001

7 rows selected.


-- LOAN TABLE
SQL> select * from loans;

LOAN_ID LOAN_TYPE                     LOAN_AMOUNT LOAN_DURAT                  INTEREST_RATE BRANCH_ID CUST_ID
------- ---------- ------------------------------ ---------- ------------------------------ --------- -------
   7001 HOME                              1500000 10 Years                              8.5       101    1001
   7002 CAR                                600000 5 Years                                 9       201    1003
   7003 PERSONAL                           250000 3 Years                                11       202    1004
   7004 EDUCATION                          400000 4 Years                              10.5       301    1005



-- TRANSACTION TABLE
SQL> select * from transactions;

TRANSACTION_ID CUST_ID ACCOUNT_ID TRANSACTION_TYP TRANSACTIO  AMOUNT TRANSACTI
-------------- ------- ---------- --------------- ---------- ------- ---------
          8001    1001       5001 Deposit         Cash          5000 17-AUG-25
          8002    1002       5002 Withdrawal      ATM           2000 22-AUG-25
          8003    1003       5003 Transfer        UPI           1500 25-AUG-25
          8004    1004       5004 LoanPayment     NetBanking    6000 07-AUG-25
          8005    1005       5005 Deposit         Cheque       10000 12-AUG-25
