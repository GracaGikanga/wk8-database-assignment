CREATE DATABASE LIBRARY;
USE LIBRARY;

CREATE TABLE books (
	bookId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    bookTitle VARCHAR (100),
    yearPublished INT
);

INSERT INTO books(bookId,bookTitle,yearPublished) VALUES 
	(1, 'The River And The Source',1994 ),
	(2, 'Things Fall Apart',1958),
    (3, 'So Long A Letter',1979),
    (4, 'Half Of A Yellow Sun', 2006),
    (5, 'The Beautiful Things That Heaven Bears',2007),
    (6, 'The Palm-Wine Drinkard', 1952),
    (7, 'Seasons Of Migration',1966),
    (8, 'Nervous Condition',1988);


CREATE TABLE Authors(
	authorId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    authorName VARCHAR (50)
);

INSERT INTO Authors(authorId,authorName) VALUES 
(101, 'Margaret.A.Ogola'),
(102, 'Chinua Achebe'),
(103, 'Mariama Ba'),
(104, 'Chimamanda Ngozi Adichie'),
(105, 'Dinaw Mengestu'),
(106, 'Amos Tutuola'),
(107, 'Tayeb Salih'),
(108, 'Tsitsi Dangarembga');


CREATE TABLE book_authors(
	bookId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    authorId INT NOT NULL,
	FOREIGN KEY (bookId) REFERENCES books(bookId),
    FOREIGN KEY (authorId) REFERENCES Authors(authorId)
);
INSERT INTO book_authors VALUES
	(1,101),
    (2,102),
    (3,103),
    (4,104),
    (5,105),
    (6,106),
    (7,107),
    (8,108);


CREATE TABLE members(
	memberID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    memberName VARCHAR(50)
);
INSERT INTO members(memberId,memberName) VALUES 
	(1001,'Amina Njoroge'),
    (1002,'David Okello'),
    (1003,'Fatima Mwangi'),
    (1004,'Brian otieno'),
    (1005,'Grace Kamau'),
    (1006,'Lydia Wanjiru'),
    (1007,'Esther Nyambura'),
    (1008,'Kevin Kiptooo'),
    (1009,'James Mutua'),
    (1010,'Samuel Ochieng');


CREATE TABLE borrowed (
	bookId INT AUTO_INCREMENT NOT NULL,
    memberID INT NOT NULL,
    borrowedDate DATE NOT NULL,
    DueDate DATE GENERATED ALWAYS AS (DATE_ADD(borrowedDate, INTERVAL 5 DAY)) STORED,

	FOREIGN KEY (bookId) REFERENCES books(bookId),
    FOREIGN KEY (memberID) REFERENCES members(memberID),
    UNIQUE(bookId,memberId,borrowedDate)
);
INSERT INTO borrowed(bookId,memberID,borrowedDate) VALUES 
	(3, 1008,'2024-05-24'),
	(8, 1002,'2025-09-01'),
	(3, 1005,'2025-09-22');
    