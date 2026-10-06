# sort_books_by_edition

Given a list of tuples where each tuple contains an integer and a string representing a book's title, write a Jac function that takes this list and returns a new list where the books are sorted by their integer values (representing the book's edition) in ascending order. In case of a tie where two or more books have the same edition number, maintain their original relative order from the input list.

Example input: `books = [(2, 'Book B'), (1, 'Book A'), (3, 'Book C'), (1, 'Book D')]`

Expected output: `[(1, 'Book A'), (1, 'Book D'), (2, 'Book B'), (3, 'Book C')]`

Example:
- `sort_books_by_edition([(1, 'Book A')]) == [(1, 'Book A')]`

Implement `sort_books_by_edition(books: list[tuple[int, str]]) -> list[tuple[int, str]]`.
