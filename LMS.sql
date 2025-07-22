-- SQL syntax for creating LMS schema
CREATE DATABASE LMS;
USE LMS;

-- Create User Table
CREATE TABLE User (
    User_ID INT(11) PRIMARY KEY,
    Full_Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(255),
    Address VARCHAR(255),
    Membership_Type VARCHAR(255),
    Join_Date DATE
);


-- Create Genre Table
CREATE TABLE Genre (
    Genre_ID INT(11) PRIMARY KEY,
    Genre_Name VARCHAR(255)
);

-- Create Author Table
CREATE TABLE Author (
    Author_ID INT(11) PRIMARY KEY,
    Author_Name VARCHAR(255)
);

-- Create LibraryBranch Table
CREATE TABLE LibraryBranch (
    Branch_ID INT(11) PRIMARY KEY,
    Branch_Name VARCHAR(255),
    Location VARCHAR(11),
    Total_Books INT(11)
);

-- Create Publisher Table
CREATE TABLE Publisher (
    Publisher_ID INT(11) PRIMARY KEY,
    Publisher_Name VARCHAR(255),
    Country VARCHAR(255),
    Year_Founded INT(11)
);

-- Create Book Table
CREATE TABLE Book (
    Book_ID INT(11) PRIMARY KEY,
    Title VARCHAR(255),
    Author_ID INT(11),
    Genre_ID INT(11),
    ISBN BIGINT(20), 
    Quantity INT(11),
    Availability VARCHAR(255),
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID),
    FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID)
);

-- Create Transaction Table
CREATE TABLE Transaction (
    Transaction_ID INT(11) PRIMARY KEY,
    User_ID INT(11),
    Book_ID INT(11),
    Borrow_Date DATE,
    Return_Date DATE,
    Status VARCHAR(255),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

-- Create BookCopy Table
CREATE TABLE BookCopy (
    Copy_ID INT(11) PRIMARY KEY,
    Book_ID INT(11),
    Branch_ID INT(11),
    Status VARCHAR(255),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
    FOREIGN KEY (Branch_ID) REFERENCES LibraryBranch(Branch_ID)
);

-- Create BorrowerHistory Table
CREATE TABLE BorrowerHistory (
    History_ID INT(11) PRIMARY KEY,
    User_ID INT(11),
    Book_ID INT(11),
    Borrow_Date DATE,
    Return_Date DATE,
    Late_Fee INT(11),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);


-- Disable foreign key checks
SET foreign_key_checks = 0;

--- Insert data into Book table
INSERT INTO Book (Book_ID, Title, Author_ID, Genre_ID, ISBN, Quantity, Availability)
VALUES
(1, 'The Great Gatsby', 1, 1, 1234567890, 5, 'Available'),
(2, 'To Kill a Mockingbird', 2, 2, 2345678901, 8, 'Available'),
(3, '1984', 3, 3, 3456789012, 10, 'Checked Out'),
(4, 'Pride and Prejudice', 4, 1, 4567890123, 3, 'Available'),
(5, 'The Catcher in the Rye', 5, 2, 5678901234, 6, 'Checked Out'),
(6, 'Brave New World', 3, 3, 6789012345, 7, 'Available'),
(7, 'Wuthering Heights', 4, 1, 7890123456, 4, 'Available'),
(8, 'To the Lighthouse', 5, 2, 8901234567, 2, 'Available'),
(9, 'The Hobbit', 1, 4, 9012345678, 9, 'Checked Out'),
(10, 'The Odyssey', 2, 5, 1234567809, 12, 'Available');

-- Displaying the LMS Books Information
select * From Book;

-- Insert data into User table
INSERT INTO User (User_ID, Full_Name, Email, Phone, Address, Membership_Type, Join_Date)
VALUES
(1, 'John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'Regular', '2023-01-01'),
(2, 'Jane Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak St', 'Premium', '2023-02-15'),
(3, 'Bob Johnson', 'bob.johnson@example.com', '555-123-4567', '789 Pine St', 'Regular', '2023-03-20'),
(4, 'Alice Williams', 'alice.williams@example.com', '111-222-3333', '101 Elm St', 'Premium', '2023-04-10'),
(5, 'Charlie Brown', 'charlie.brown@example.com', '444-555-6666', '202 Birch St', 'Regular', '2023-05-05'),
(6, 'Eva Davis', 'eva.davis@example.com', '777-888-9999', '303 Cedar St', 'Premium', '2023-06-18'),
(7, 'Frank Miller', 'frank.miller@example.com', '333-999-7777', '404 Maple St', 'Regular', '2023-07-30'),
(8, 'Grace Wilson', 'grace.wilson@example.com', '666-444-1111', '505 Walnut St', 'Premium', '2023-08-22'),
(9, 'David Lee', 'david.lee@example.com', '222-666-8888', '606 Pine St', 'Regular', '2023-09-14'),
(10, 'Sophie Turner', 'sophie.turner@example.com', '999-111-2222', '707 Oak St', 'Premium', '2023-10-09');

--  Displaying the LMS User Information
select * From User;

-- Insert data into Transaction table
INSERT INTO Transaction (Transaction_ID, User_ID, Book_ID, Borrow_Date, Return_Date, Status)
VALUES
(1, 1, 3, '2023-01-05', '2023-01-15', 'Closed'),
(2, 2, 5, '2023-02-20', '2023-03-01', 'Closed'),
(3, 3, 9, '2023-03-25', '2023-04-05', 'Closed'),
(4, 4, 2, '2023-04-15', '2023-04-25', 'Closed'),
(5, 5, 8, '2023-05-10', '2023-05-20', 'Closed'),
(6, 6, 1, '2023-06-25', '2023-07-05', 'Closed'),
(7, 7, 7, '2023-07-15', '2023-07-25', 'Closed'),
(8, 8, 6, '2023-08-01', '2023-08-11', 'Closed'),
(9, 9, 4, '2023-09-20', '2023-09-30', 'Closed'),
(10, 10, 10, '2023-10-15', '2023-10-25', 'Closed');

 -- Displaying the LMS Transaction Information
select * from Transaction;


-- Insert data into Genre table
INSERT INTO Genre (Genre_ID, Genre_Name)
VALUES
(1, 'Fiction'),
(2, 'Classic'),
(3, 'Science Fiction'),
(4, 'Fantasy'),
(5, 'Epic');

-- Displaying Genre Information
select * from Genre;


-- Insert data into Author table
INSERT INTO Author (Author_ID, Author_Name)
VALUES
(1, 'F. Scott Fitzgerald'),
(2, 'Harper Lee'),
(3, 'George Orwell'),
(4, 'Jane Austen'),
(5, 'J.D. Salinger');

-- Selecting Author Information
select * from Author;



-- Insert data into LibraryBranch table
INSERT INTO LibraryBranch (Branch_ID, Branch_Name, Location, Total_Books)
VALUES
(1, 'Main Branch', 'City Center', 5000),
(2, 'East Branch', 'East Side', 3000),
(3, 'West Branch', 'West Side', 2500),
(4, 'North Branch', 'North Side', 2000),
(5, 'South Branch', 'South Side', 1800);

-- Selecting the Library Branches of LMS
select * from LibraryBranch;

-- Insert data into Publisher table
INSERT INTO Publisher (Publisher_ID, Publisher_Name, Country, Year_Founded)
VALUES
(1, 'Penguin Random House', 'USA', 1927),
(2, 'HarperCollins', 'USA', 1989),
(3, 'Simon & Schuster', 'USA', 1924),
(4, 'Macmillan Publishers', 'UK', 1843),
(5, 'Hachette Livre', 'France', 1826);

-- Display Publisher Table
select * From Publisher;

-- Insert data into BookCopy table
INSERT INTO BookCopy (Copy_ID, Book_ID, Branch_ID, Status)
VALUES
(1, 1, 1, 'Available'),
(2, 2, 2, 'Checked Out'),
(3, 3, 3, 'Available'),
(4, 4, 4, 'Available'),
(5, 5, 5, 'Checked Out'),
(6, 6, 1, 'Available'),
(7, 7, 2, 'Available'),
(8, 8, 3, 'Available'),
(9, 9, 4, 'Checked Out'),
(10, 10, 5, 'Available');

-- Display BookCopies
select * From BookCopy;

-- Insert data into BorrowerHistory table
INSERT INTO BorrowerHistory (History_ID, User_ID, Book_ID, Borrow_Date, Return_Date, Late_Fee)
VALUES
(1, 1, 3, '2023-01-05', '2023-01-15', 0),
(2, 2, 5, '2023-02-20', '2023-03-01', 0),
(3, 3, 9, '2023-03-25', '2023-04-05', 0),
(4, 4, 2, '2023-04-15', '2023-04-25', 0),
(5, 5, 8, '2023-05-10', '2023-05-20', 0),
(6, 6, 1, '2023-06-25', '2023-07-05', 0),
(7, 7, 7, '2023-07-15', '2023-07-25', 0),
(8, 8, 6, '2023-08-01', '2023-08-11', 0),
(9, 9, 4, '2023-09-20', '2023-09-30', 0),
(10, 10, 10, '2023-10-15', '2023-10-25', 0);

-- Display Borrowing Histroy 
select * From BorrowerHistory;

--  Regular Views
-- View for available books
CREATE VIEW AvailableBooks AS
SELECT Book_ID, Title, Quantity
FROM Book
WHERE Availability = 'Available';
select * from AvailableBooks;

-- View for checked out books
-- Creating CheckedOutBooks View with Joins
CREATE VIEW CheckedOutBooks AS
SELECT
    B.Book_ID,
    B.Title,
    B.Quantity,
    A.Author_Name,
    G.Genre_Name
FROM
    Book B
JOIN
    Author A ON B.Author_ID = A.Author_ID
JOIN
    Genre G ON B.Genre_ID = G.Genre_ID
WHERE
    B.Availability = 'Checked Out';
select * from CheckedOutBooks;

-- Materialized Views
-- View for user transactions
CREATE VIEW UserTransactions AS
SELECT t.Transaction_ID, t.User_ID, u.Full_Name, t.Book_ID, b.Title, t.Borrow_Date, t.Return_Date, t.Status
FROM Transaction t
JOIN User u ON t.User_ID = u.User_ID
JOIN Book b ON t.Book_ID = b.Book_ID;
select * From UserTransactions;

--  View for user Information
CREATE VIEW UserInformation AS
SELECT User_ID, Full_Name, Email, Phone, Address, Membership_Type, Join_Date
FROM User;
select * from  UserInformation;


-- Creating UserInformation2 View
CREATE VIEW UserInformation2 AS
SELECT
    U.User_ID,
    U.Full_Name,
    U.Email,
    U.Phone,
    U.Address,
    U.Membership_Type,
    U.Join_Date,
    B.Branch_Name,
    BH.Borrow_Date,
    BH.Return_Date
FROM
    User U
JOIN
    BorrowerHistory BH ON U.User_ID = BH.User_ID
JOIN
    BookCopy BC ON BH.Book_ID = BC.Book_ID
JOIN
    LibraryBranch B ON BC.Branch_ID = B.Branch_ID;
select * from userInformation2;


-- Enable foreign key checks
SET foreign_key_checks = 1;