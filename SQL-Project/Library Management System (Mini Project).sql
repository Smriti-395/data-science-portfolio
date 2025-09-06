-- Create Database
CREATE DATABASE library;
USE library;

-- Create Members Table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- Create Books Table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100),
    genre VARCHAR(50),
    available_copies INT DEFAULT 1
);


-- Create Borrow Records Table
CREATE TABLE borrow_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);


-- Insert Sample Members
-- Books
INSERT INTO books (title, author, genre, available_copies) VALUES
('Python Crash Course', 'Eric Matthes', 'Programming', 5),
('Clean Code', 'Robert C. Martin', 'Programming', 3),
('Harry Potter', 'J.K. Rowling', 'Fantasy', 10),
('The Alchemist', 'Paulo Coelho', 'Fiction', 4);

-- Members
INSERT INTO members (name, email) VALUES
('Aarav', 'aarav@gmail.com'),
('Smriti', 'smriti@gmail.com'),
('Neha', 'neha@gmail.com');

-- Borrow_records
INSERT INTO borrow_records (book_id, member_id, borrow_date)
VALUES (1, 2, CURDATE());

-- When a book is borrowed, reduce available copies:
UPDATE books
SET available_copies = available_copies - 1
WHERE book_id = 1;

-- Return Books
UPDATE borrow_records
SET return_date = CURDATE()
WHERE record_id = 1;

UPDATE books
SET available_copies = available_copies + 1
WHERE book_id = 1;

-- Show all available books
SELECT * FROM books WHERE available_copies > 0;

-- Show all borrowed books with member name
SELECT b.title, m.name, br.borrow_date, br.return_date
FROM borrow_records br
JOIN books b ON br.book_id = b.book_id
JOIN members m ON br.member_id = m.member_id;

--Find members who have not returned books
SELECT m.name, b.title, br.borrow_date
FROM borrow_records br
JOIN members m ON br.member_id = m.member_id
JOIN books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL;

SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM borrow_records;

-- List all books by a specific author
SELECT * FROM books WHERE author = 'Paulo Coelho';

-- Show all members who joined recently
SELECT * FROM members ORDER BY join_date DESC;

-- Show which member borrowed which book.
SELECT m.name, b.title, r.borrow_date
FROM borrow_records r
JOIN members m ON r.member_id = m.member_id
JOIN books b ON r.book_id = b.book_id;

-- Update copies when a book is borrowed
UPDATE books SET available_copies = available_copies - 1 WHERE book_id = 1;

-- Delete a member.
DELETE FROM members WHERE member_id = 3;

-- Count of Books by Genre
SELECT genre, COUNT(*) AS total_books
FROM books
GROUP BY genre;

-- Members with Most Borrowed Books.
SELECT m.name, COUNT(r.record_id) AS total_borrowed
FROM borrow_records r
JOIN members m ON r.member_id = m.member_id
GROUP BY m.name
ORDER BY total_borrowed DESC;

-- Books Currently Available
SELECT title, available_copies
FROM books
WHERE available_copies > 0;

-- Overdue Books (Assume 7-day return policy)
SELECT m.name, b.title, r.borrow_date
FROM borrow_records r
JOIN members m ON r.member_id = m.member_id
JOIN books b ON r.book_id = b.book_id
WHERE r.return_date IS NULL 
  AND r.borrow_date < CURDATE() - INTERVAL 7 DAY;

-- Popular Genre Borrowed the Most
SELECT b.genre, COUNT(*) AS borrow_count
FROM borrow_records r
JOIN books b ON r.book_id = b.book_id
GROUP BY b.genre
ORDER BY borrow_count DESC;

-- Create a View
CREATE VIEW borrowed_books_view AS
SELECT m.name AS member, b.title AS book, r.borrow_date, r.return_date
FROM borrow_records r
JOIN members m ON r.member_id = m.member_id
JOIN books b ON r.book_id = b.book_id;

SELECT * FROM borrowed_books_view;



