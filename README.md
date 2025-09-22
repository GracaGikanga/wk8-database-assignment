📚 Library Database

This project defines a Library Management Database in MySQL. It contains tables for books, authors, members, and borrowing records.



🗂️ Database Structure
1. Books (books)

Stores the library’s books.

bookId – Primary key (auto-increment).

bookTitle – Title of the book.

yearPublished – Year the book was published.



2. Authors (Authors)

Stores authors whose books are in the library.

authorId – Primary key (auto-increment).

authorName – Name of the author.


3. Book Authors (book_authors)

Associates books with their authors (many-to-many relationship).

bookId – Foreign key → books.bookId.

authorId – Foreign key → Authors.authorId.


4. Members (members)

Represents registered library members.

memberId – Primary key (auto-increment).

memberName – Full name of the member.


5. Borrowed (borrowed)

Tracks which member borrowed which book and when.

bookId – Foreign key → books.bookId.

memberId – Foreign key → members.memberId.

borrowedDate – Date when the book was borrowed.

DueDate – Auto-generated, always 5 days after borrowedDate.

Unique constraint – A member cannot borrow the same book more than once on the same day.

