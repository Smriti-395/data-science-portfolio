📂 Student Library Management System (SQL Project)
📌 Introduction

This project demonstrates the use of SQL for managing a simple library system.
It covers table creation, insertion of records, joins, aggregation, and advanced queries.
The project helps in understanding how relational databases can be used in real-world scenarios like library management.

📌 ER Diagram
Members (member_id, name, email, join_date)  
Books (book_id, title, author, genre, published_year, available)  
Borrow_Records (record_id, member_id, book_id, borrow_date, return_date)

#**Database Setup**

CREATE DATABASE library;
USE library;

CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    join_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    author VARCHAR(100),
    genre VARCHAR(50),
    published_year INT,
    available BOOLEAN DEFAULT TRUE
);

CREATE TABLE borrow_records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE DEFAULT CURRENT_DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

**📌 Sample Queries**
🔹 Insert Data
INSERT INTO members (name, email) VALUES
('Ishita', 'ishita@gmail.com'),
('Rohan', 'rohan@gmail.com'),
('Aarav', 'aarav@gmail.com');

INSERT INTO books (title, author, genre, published_year) VALUES
('Python Basics', 'John Doe', 'Programming', 2020),
('Data Science Handbook', 'Jane Smith', 'Data Science', 2021),
('Machine Learning 101', 'Sam Lee', 'AI', 2019);

**Output Example:**
| member\_id | name   | email                                       | join\_date |
| ---------- | ------ | ------------------------------------------- | ---------- |
| 1          | Ishita | [ishita@gmail.com](mailto:ishita@gmail.com) | 2024-09-05 |
| 2          | Rohan  | [rohan@gmail.com](mailto:rohan@gmail.com)   | 2024-09-05 |
| 3          | Aarav  | [aarav@gmail.com](mailto:aarav@gmail.com)   | 2024-09-05 |

**🔹 Inner Join**
SELECT m.name, b.title, r.borrow_date
FROM borrow_records r
JOIN members m ON r.member_id = m.member_id
JOIN books b ON r.book_id = b.book_id;

**Output Example:**
| name   | title         | borrow\_date |
| ------ | ------------- | ------------ |
| Ishita | Python Basics | 2024-09-05   |

**🔹 Aggregation**
SELECT b.genre, COUNT(*) AS total_books
FROM books b
GROUP BY b.genre;

**Output Example:**
| genre        | total\_books |
| ------------ | ------------ |
| Programming  | 1            |
| Data Science | 1            |
| AI           | 1            |

**🔹 Advanced Query (Most Active Member)**
SELECT m.name, COUNT(r.book_id) AS books_borrowed
FROM members m
JOIN borrow_records r ON m.member_id = r.member_id
GROUP BY m.name
ORDER BY books_borrowed DESC
LIMIT 1;

**Output Example:**
| name   | books\_borrowed |
| ------ | --------------- |
| Ishita | 1               |

**📌 Observations**

- SQL allows efficient storage and retrieval of structured data.
- Joins help in combining information from multiple tables.
- Aggregations provide insights such as most popular genres or most active members.
- This project demonstrates core SQL concepts useful in data analytics & backend development.
SELECT * FROM members;

