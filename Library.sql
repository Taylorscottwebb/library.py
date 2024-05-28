CREATE DATABASE library_management_system;

USE library_management_system; 

DROP TABLE users;
DROP TABLE authors;
DROP TABLE genres; 
DROP TABLE Borrowed_Books;
DROP TABLE Book;

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    library_id INT NOT NULL UNIQUE
);

CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    biography TEXT NOT NULL
);

CREATE TABLE Genre (
	genre_id INT AUTO_INCREMENT PRIMARY KEY,   
    genre_name VARCHAR(50),
    genre_category VARCHAR(50)
);

CREATE TABLE Borrowed_Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    user_library_id INT NOT NULL UNIQUE,
    book_isbn INT NOT NULL,
    user_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

SELECT * FROM Borrowed_Books;


CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(13) NOT NULL,
    title VARCHAR(255) NOT NULL,
    book_publication_date DATE, 
    availability BOOLEAN DEFAULT 1,
    author_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES author(author_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);


SELECT * FROM Author;
SELECT * FROM Genre;
SELECT * FROM Book;
SELECT * FROM User;
SELECT * FROM Borrowed_Books;