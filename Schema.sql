-- BANK TABLE
CREATE TABLE Bank (
        Bank_id INT PRIMARY KEY,
        Bank_Name VARCHAR2(100) NOT NULL,
        Head_Office_Address VARCHAR2(200)
    );


-- BRANCH TABLE
CREATE TABLE Branch (
        Branch_id INT PRIMARY KEY,
        Branch_name VARCHAR2(100) NOT NULL,
        Branch_address VARCHAR2(200),
        IFSC_code VARCHAR2(20) UNIQUE,
        Bank_id INT,
        FOREIGN KEY (Bank_id) REFERENCES Bank(Bank_id)
    );

-- EMPLOYEE TABLE
CREATE TABLE Employee (
            Emp_id INT PRIMARY KEY,
            Emp_name VARCHAR2(20) NOT NULL,
            Emp_position VARCHAR2(20),
            Emp_Addr VARCHAR2(70),
            Emp_Contact VARCHAR2(10) UNIQUE CHECK (LENGTH(Emp_Contact) = 10),
            Salary INT,
            branch_id INT,
            FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
     );

-- CUSTOMER TABLE
Create table Customers(
    Cust_id int primary key,
    Cust_NAME varchar2(50) not null,
    Cust_Contact varchar2(10) unique check (length(Cust_Contact)=10),
    Cust_Addr varchar2(50),
    cust_Email varchar2(50) unique,
    Aadhar_no varchar2(20) unique,
    branch_id,
    foreign key (Branch_id) references Branch(Branch_id)
);

-- ACCOUNT TABLE
CREATE TABLE Account (
    Account_id INT PRIMARY KEY,
    Account_type VARCHAR2(20) CHECK (Account_type IN ('Savings','Current','FixedDeposit')),
    Bank_acc_no VARCHAR2(15) UNIQUE NOT NULL,
    Acc_Balance DECIMAL(15,2) DEFAULT 0,
    Branch_id INT,
    FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id)
);

-- LOAN TABLE
CREATE TABLE Loan (
    Loan_id INT PRIMARY KEY,
    Loan_type VARCHAR2(50),
    Loan_amount DECIMAL(15,2) check(Loan_Amount>0),
    Loan_duration varchar2(20),
    Interest_rate DECIMAL(5,2),
    Branch_id int,
    Cust_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(Branch_id),
    FOREIGN KEY (Cust_id) REFERENCES Customers(Cust_id)
);


-- TRANSACTION TABLE
CREATE TABLE Transaction (
    Transaction_id INT PRIMARY KEY,
    Cust_id INT,
    Account_id INT,
    Transaction_Type VARCHAR2(20) CHECK (Transaction_Type IN ('Deposit','Withdrawal','Transfer','LoanPayment')),
    Transaction_mode VARCHAR2(20) CHECK (Transaction_mode IN ('Cash','UPI','NetBanking','ATM','Cheque')),
    Amount DECIMAL(15,2) NOT NULL,
    Transaction_Date DATE DEFAULT SYSDATE,
    FOREIGN KEY (Cust_id) REFERENCES Customers(Cust_id),
    FOREIGN KEY (Account_id) REFERENCES Account(Account_id)
);
