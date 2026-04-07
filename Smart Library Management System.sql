mysql> Create Database Smart_Library;
Query OK, 1 row affected (0.202 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| cdb                |
| companydb          |
| data_trans         |
| final              |
| fusion             |
| huion              |
| information_schema |
| jay                |
| joins              |
| man                |
| man2               |
| man4               |
| man5               |
| man_sql            |
| mark               |
| markii             |
| mt                 |
| mysql              |
| performance_schema |
| rdj                |
| sakila             |
| smart_library      |
| sys                |
| trivedi            |
| vision             |
| workforce_db       |
| world              |
+--------------------+
27 rows in set (0.470 sec)

mysql> USE Smart_Library;
Database changed
mysql> CREATE TABLE Authors(
    -> Author_id INT Auto_increment Primary key,
    -> Name Varchar(50) NOT NULL,
    -> Email Varchar(50));
Query OK, 0 rows affected (0.346 sec)

mysql> CREATE TABLE Books (
    -> book_id INT AUTO_INCREMENT PRIMARY KEY,
    -> title VARCHAR(200) NOT NULL,
    -> author_id INT,
    -> category VARCHAR(50),
    -> isbn VARCHAR(20) UNIQUE,
    -> published_date DATE,
    -> price DECIMAL(10,2),
    -> available_copies INT,
    -> FOREIGN KEY (author_id) REFERENCES Authors(author_id)
    -> );
Query OK, 0 rows affected (0.290 sec)

mysql> CREATE TABLE Members (
    -> member_id INT AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(100) NOT NULL,
    -> email VARCHAR(100),
    -> phone_number VARCHAR(15),
    -> membership_date DATE
    -> );
Query OK, 0 rows affected (0.143 sec)

mysql> CREATE TABLE Transactions (
    -> transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    -> member_id INT,
    -> book_id INT,
    -> borrow_date DATE,
    -> return_date DATE,
    -> fine_amount DECIMAL(10,2),
    -> FOREIGN KEY (member_id) REFERENCES Members(member_id),
    -> FOREIGN KEY (book_id) REFERENCES Books(book_id)
    -> );
Query OK, 0 rows affected (0.332 sec)

mysql> INSERT INTO Authors (name, email) VALUES
    -> ('Ramesh Sharma', 'ramesh.sharma@example.com'),
    -> ('Priya Patel', 'priya.patel@example.com'),
    -> ('Amit Desai', 'amit.desai@example.com');
Query OK, 3 rows affected (0.144 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO Books (title, author_id, category, isbn, published_date, price, available_copies) VALUES
    -> ('Data Science Basics', 1, 'Science', 'ISBN001', '2018-05-12', 450.00, 5),
    -> ('Advanced SQL Queries', 2, 'Technology', 'ISBN002', '2021-07-20', 600.00, 3),
    -> ('Indian History', 3, 'History', 'ISBN003', '2005-03-15', 300.00, 2),
    -> ('Modern Physics', 1, 'Science', 'ISBN004', '2016-11-01', 700.00, 4);
Query OK, 4 rows affected (0.036 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO Members (name, email, phone_number, membership_date) VALUES
    -> ('Rahul Mehta', 'rahul.mehta@example.com', '9876543210', '2021-01-10'),
    -> ('Sneha Joshi', 'sneha.joshi@example.com', '9123456789', '2019-06-25'),
    -> ('Karan Singh', 'karan.singh@example.com', '9988776655', '2023-02-14');
Query OK, 3 rows affected (0.019 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO Transactions (member_id, book_id, borrow_date, return_date, fine_amount) VALUES
    -> (1, 1, '2023-01-05', '2023-01-15', 0.00),
    -> (2, 2, '2023-03-10', '2023-03-25', 50.00),
    -> (3, 3, '2023-04-01', NULL, 0.00);
Query OK, 3 rows affected (0.022 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Authors;
+-----------+---------------+---------------------------+
| Author_id | Name          | Email                     |
+-----------+---------------+---------------------------+
|         1 | Ramesh Sharma | ramesh.sharma@example.com |
|         2 | Priya Patel   | priya.patel@example.com   |
|         3 | Amit Desai    | amit.desai@example.com    |
+-----------+---------------+---------------------------+
3 rows in set (0.036 sec)

mysql> SELECT * FROM Books;
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
| book_id | title                | author_id | category   | isbn    | published_date | price  | available_copies |
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
|       1 | Data Science Basics  |         1 | Science    | ISBN001 | 2018-05-12     | 450.00 |                5 |
|       2 | Advanced SQL Queries |         2 | Technology | ISBN002 | 2021-07-20     | 600.00 |                3 |
|       3 | Indian History       |         3 | History    | ISBN003 | 2005-03-15     | 300.00 |                2 |
|       4 | Modern Physics       |         1 | Science    | ISBN004 | 2016-11-01     | 700.00 |                4 |
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
4 rows in set (0.012 sec)

mysql> SELECT * FROM Transactions;
+----------------+-----------+---------+-------------+-------------+-------------+
| transaction_id | member_id | book_id | borrow_date | return_date | fine_amount |
+----------------+-----------+---------+-------------+-------------+-------------+
|              1 |         1 |       1 | 2023-01-05  | 2023-01-15  |        0.00 |
|              2 |         2 |       2 | 2023-03-10  | 2023-03-25  |       50.00 |
|              3 |         3 |       3 | 2023-04-01  | NULL        |        0.00 |
+----------------+-----------+---------+-------------+-------------+-------------+
3 rows in set (0.010 sec)

mysql> Insert into Books (title, author_id, category, isbn, published_date, price, available_copies)
    -> Values
    -> ('AI Revolution', 2, 'Technology', 'ISBN005', '2022-09-10', 800.00, 6);
Query OK, 1 row affected (0.065 sec)

mysql> Update Books SET available_copies = available_copies - 1 Where book_id = 1;
Query OK, 1 row affected (0.099 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Books;
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
| book_id | title                | author_id | category   | isbn    | published_date | price  | available_copies |
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
|       1 | Data Science Basics  |         1 | Science    | ISBN001 | 2018-05-12     | 450.00 |                4 |
|       2 | Advanced SQL Queries |         2 | Technology | ISBN002 | 2021-07-20     | 600.00 |                3 |
|       3 | Indian History       |         3 | History    | ISBN003 | 2005-03-15     | 300.00 |                2 |
|       4 | Modern Physics       |         1 | Science    | ISBN004 | 2016-11-01     | 700.00 |                4 |
|       5 | AI Revolution        |         2 | Technology | ISBN005 | 2022-09-10     | 800.00 |                6 |
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
5 rows in set (0.010 sec)
mysql> DELETE FROM Members
    -> WHERE member_id NOT IN (SELECT DISTINCT member_id FROM Transactions);
Query OK, 0 rows affected (0.008 sec)
ysql> SELECT * FROM Transactions;
+----------------+-----------+---------+-------------+-------------+-------------+
| transaction_id | member_id | book_id | borrow_date | return_date | fine_amount |
+----------------+-----------+---------+-------------+-------------+-------------+
|              1 |         1 |       1 | 2023-01-05  | 2023-01-15  |        0.00 |
|              2 |         2 |       2 | 2023-03-10  | 2023-03-25  |       50.00 |
|              3 |         3 |       3 | 2023-04-01  | NULL        |        0.00 |
+----------------+-----------+---------+-------------+-------------+-------------+
3 rows in set (0.012 sec)
mysql> SELECT * FROM Books WHERE available_copies > 0;
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
| book_id | title                | author_id | category   | isbn    | published_date | price  | available_copies |
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
|       1 | Data Science Basics  |         1 | Science    | ISBN001 | 2018-05-12     | 450.00 |                4 |
|       2 | Advanced SQL Queries |         2 | Technology | ISBN002 | 2021-07-20     | 600.00 |                3 |
|       3 | Indian History       |         3 | History    | ISBN003 | 2005-03-15     | 300.00 |                2 |
|       4 | Modern Physics       |         1 | Science    | ISBN004 | 2016-11-01     | 700.00 |                4 |
|       5 | AI Revolution        |         2 | Technology | ISBN005 | 2022-09-10     | 800.00 |                6 |
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
5 rows in set (0.011 sec)
mysql> SELECT * FROM Books WHERE YEAR(published_date) > 2015;
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
| book_id | title                | author_id | category   | isbn    | published_date | price  | available_copies |
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
|       1 | Data Science Basics  |         1 | Science    | ISBN001 | 2018-05-12     | 450.00 |                4 |
|       2 | Advanced SQL Queries |         2 | Technology | ISBN002 | 2021-07-20     | 600.00 |                3 |
|       4 | Modern Physics       |         1 | Science    | ISBN004 | 2016-11-01     | 700.00 |                4 |
|       5 | AI Revolution        |         2 | Technology | ISBN005 | 2022-09-10     | 800.00 |                6 |
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
4 rows in set (0.035 sec)
mysql> SELECT * FROM Books ORDER BY price DESC LIMIT 3;
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
| book_id | title                | author_id | category   | isbn    | published_date | price  | available_copies |
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
|       5 | AI Revolution        |         2 | Technology | ISBN005 | 2022-09-10     | 800.00 |                6 |
|       4 | Modern Physics       |         1 | Science    | ISBN004 | 2016-11-01     | 700.00 |                4 |
|       2 | Advanced SQL Queries |         2 | Technology | ISBN002 | 2021-07-20     | 600.00 |                3 |
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
3 rows in set (0.013 sec)
mysql> SELECT * FROM Members WHERE YEAR(membership_date) < 2022;
+-----------+-------------+-------------------------+--------------+-----------------+
| member_id | name        | email                   | phone_number | membership_date |
+-----------+-------------+-------------------------+--------------+-----------------+
|         1 | Rahul Mehta | rahul.mehta@example.com | 9876543210   | 2021-01-10      |
|         2 | Sneha Joshi | sneha.joshi@example.com | 9123456789   | 2019-06-25      |
+-----------+-------------+-------------------------+--------------+-----------------+
2 rows in set (0.010 sec)
ysql> SELECT * FROM Books WHERE category='Science' AND price < 500;
+---------+---------------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title               | author_id | category | isbn    | published_date | price  | available_copies |
+---------+---------------------+-----------+----------+---------+----------------+--------+------------------+
|       1 | Data Science Basics |         1 | Science  | ISBN001 | 2018-05-12     | 450.00 |                4 |
+---------+---------------------+-----------+----------+---------+----------------+--------+------------------+
1 row in set (0.035 sec)
mysql> SELECT * FROM Books WHERE available_copies = 4;
+---------+---------------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title               | author_id | category | isbn    | published_date | price  | available_copies |
+---------+---------------------+-----------+----------+---------+----------------+--------+------------------+
|       1 | Data Science Basics |         1 | Science  | ISBN001 | 2018-05-12     | 450.00 |                4 |
|       4 | Modern Physics      |         1 | Science  | ISBN004 | 2016-11-01     | 700.00 |                4 |
+---------+---------------------+-----------+----------+---------+----------------+--------+------------------+
2 rows in set (0.011 sec)
mysql> SELECT * FROM Members WHERE YEAR(membership_date) > 2020 OR member_id IN (SELECT member_id FROM Transactions GROUP BY member_id HAVING COUNT(*) > 3);
+-----------+-------------+-------------------------+--------------+-----------------+
| member_id | name        | email                   | phone_number | membership_date |
+-----------+-------------+-------------------------+--------------+-----------------+
|         1 | Rahul Mehta | rahul.mehta@example.com | 9876543210   | 2021-01-10      |
|         3 | Karan Singh | karan.singh@example.com | 9988776655   | 2023-02-14      |
+-----------+-------------+-------------------------+--------------+-----------------+
2 rows in set (0.015 sec)
mysql> SELECT * FROM Books ORDER BY title ASC;
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
| book_id | title                | author_id | category   | isbn    | published_date | price  | available_copies |
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
|       2 | Advanced SQL Queries |         2 | Technology | ISBN002 | 2021-07-20     | 600.00 |                3 |
|       5 | AI Revolution        |         2 | Technology | ISBN005 | 2022-09-10     | 800.00 |                6 |
|       1 | Data Science Basics  |         1 | Science    | ISBN001 | 2018-05-12     | 450.00 |                4 |
|       3 | Indian History       |         3 | History    | ISBN003 | 2005-03-15     | 300.00 |                2 |
|       4 | Modern Physics       |         1 | Science    | ISBN004 | 2016-11-01     | 700.00 |                4 |
+---------+----------------------+-----------+------------+---------+----------------+--------+------------------+
5 rows in set (0.012 sec)
mysql> SELECT member_id, COUNT(*) AS books_borrowed FROM Transactions GROUP BY member_id;
+-----------+----------------+
| member_id | books_borrowed |
+-----------+----------------+
|         1 |              1 |
|         2 |              1 |
|         3 |              1 |
+-----------+----------------+
3 rows in set (0.011 sec)
mysql> SELECT category, COUNT(*) AS total_books FROM Books GROUP BY category;
+------------+-------------+
| category   | total_books |
+------------+-------------+
| Science    |           2 |
| Technology |           2 |
| History    |           1 |
+------------+-------------+
3 rows in set (0.037 sec)
mysql> SELECT category, COUNT(*) FROM Books GROUP BY category;
+------------+----------+
| category   | COUNT(*) |
+------------+----------+
| Science    |        2 |
| Technology |        2 |
| History    |        1 |
+------------+----------+
3 rows in set (0.010 sec)

mysql> SELECT AVG(price) AS avg_price FROM Books;
+------------+
| avg_price  |
+------------+
| 570.000000 |
+------------+
1 row in set (0.005 sec)

mysql> SELECT book_id, COUNT(*) AS borrow_count FROM Transactions GROUP BY book_id ORDER BY borrow_count DESC LIMIT 1;
+---------+--------------+
| book_id | borrow_count |
+---------+--------------+
|       1 |            1 |
+---------+--------------+
1 row in set (0.035 sec)

mysql> SELECT SUM(fine_amount) AS total_fines FROM Transactions;
+-------------+
| total_fines |
+-------------+
|       50.00 |
+-------------+
1 row in set (0.003 sec)
mysql> SELECT * FROM Books WHERE book_id IN (
    -> SELECT book_id FROM Transactions WHERE member_id IN (
    -> SELECT member_id FROM Members WHERE YEAR(membership_date) > 2022));
+---------+----------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title          | author_id | category | isbn    | published_date | price  | available_copies |
+---------+----------------+-----------+----------+---------+----------------+--------+------------------+
|       3 | Indian History |         3 | History  | ISBN003 | 2005-03-15     | 300.00 |                2 |
+---------+----------------+-----------+----------+---------+----------------+--------+------------------+
1 row in set (0.017 sec)
mysql> SELECT book_id FROM Transactions GROUP BY book_id ORDER BY COUNT(*) DESC LIMIT 1;
+---------+
| book_id |
+---------+
|       1 |
+---------+
1 row in set (0.008 sec)
mysql> SELECT YEAR(published_date), COUNT(*) FROM Books GROUP BY YEAR(published_date);
+----------------------+----------+
| YEAR(published_date) | COUNT(*) |
+----------------------+----------+
|                 2018 |        1 |
|                 2021 |        1 |
|                 2005 |        1 |
|                 2016 |        1 |
|                 2022 |        1 |
+----------------------+----------+
5 rows in set (0.019 sec)

mysql> SELECT transaction_id, DATEDIFF(return_date, borrow_date) AS days_borrowed FROM Transactions;
+----------------+---------------+
| transaction_id | days_borrowed |
+----------------+---------------+
|              1 |            10 |
|              2 |            15 |
|              3 |          NULL |
+----------------+---------------+
3 rows in set (0.035 sec)

mysql> SELECT DATE_FORMAT(borrow_date, '%d-%m-%Y') AS formatted_date FROM Transactions;
+----------------+
| formatted_date |
+----------------+
| 05-01-2023     |
| 10-03-2023     |
| 01-04-2023     |
+----------------+
3 rows in set (0.019 sec)
mysql> SELECT UPPER(title) FROM Books;
+----------------------+
| UPPER(title)         |
+----------------------+
| DATA SCIENCE BASICS  |
| ADVANCED SQL QUERIES |
| INDIAN HISTORY       |
| MODERN PHYSICS       |
| AI REVOLUTION        |
+----------------------+
5 rows in set (0.103 sec)

mysql> SELECT TRIM(name) FROM Authors;
+---------------+
| TRIM(name)    |
+---------------+
| Ramesh Sharma |
| Priya Patel   |
| Amit Desai    |
+---------------+
3 rows in set (0.014 sec)

mysql> SELECT IFNULL(email, 'Not Provided') FROM Authors;
+-------------------------------+
| IFNULL(email, 'Not Provided') |
+-------------------------------+
| ramesh.sharma@example.com     |
| priya.patel@example.com       |
| amit.desai@example.com        |
+-------------------------------+
3 rows in set (0.025 sec)
mysql> SELECT book_id, COUNT(*) AS borrow_count,
    -> RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_books
    -> FROM Transactions GROUP BY book_id;
+---------+--------------+------------+
| book_id | borrow_count | rank_books |
+---------+--------------+------------+
|       1 |            1 |          1 |
|       2 |            1 |          1 |
|       3 |            1 |          1 |
+---------+--------------+------------+
3 rows in set (0.032 sec)
mysql> SELECT member_id, COUNT(*) AS total_borrowed,
    -> SUM(COUNT(*)) OVER (ORDER BY member_id) AS cumulative_borrowed
    -> FROM Transactions GROUP BY member_id;
+-----------+----------------+---------------------+
| member_id | total_borrowed | cumulative_borrowed |
+-----------+----------------+---------------------+
|         1 |              1 |                   1 |
|         2 |              1 |                   2 |
|         3 |              1 |                   3 |
+-----------+----------------+---------------------+
3 rows in set (0.022 sec)
mysql> -- Moving average (example: last 3 months)
Query OK, 0 rows affected (0.006 sec)
mysql> SELECT borrow_date,
    -> AVG(COUNT(*)) OVER (ORDER BY borrow_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
    -> FROM Transactions GROUP BY borrow_date;
+-------------+------------+
| borrow_date | moving_avg |
+-------------+------------+
| 2023-01-05  |     1.0000 |
| 2023-03-10  |     1.0000 |
| 2023-04-01  |     1.0000 |
+-------------+------------+
3 rows in set (0.011 sec)
mysql> SELECT member_id,
    -> CASE
    -> WHEN MAX(borrow_date) >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH) THEN 'Active'
    -> ELSE 'Inactive'
    -> END AS Membership_Status
    -> FROM Transactions GROUP BY member_id;
+-----------+-------------------+
| member_id | Membership_Status |
+-----------+-------------------+
|         1 | Inactive          |
|         2 | Inactive          |
|         3 | Inactive          |
+-----------+-------------------+
3 rows in set (0.029 sec)
mysql> SELECT title,
    -> CASE
    -> WHEN YEAR(published_date) > 2020 THEN 'New Arrival'
    -> WHEN YEAR(published_date) < 2000 THEN 'Classic'
    ->            ELSE 'Regular'
    ->        END AS Book_Category
    -> FROM Books;
+----------------------+---------------+
| title                | Book_Category |
+----------------------+---------------+
| Data Science Basics  | Regular       |
| Advanced SQL Queries | New Arrival   |
| Indian History       | Regular       |
| Modern Physics       | Regular       |
| AI Revolution        | New Arrival   |
+----------------------+---------------+
5 rows in set (0.014 sec)