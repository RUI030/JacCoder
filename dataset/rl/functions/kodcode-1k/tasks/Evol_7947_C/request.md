# books_to_rewrap

Calculate the total number of books that need rewrapping.

Parameters:
fiction_books (int): Number of fiction books.
non_fiction_books (int): Number of non-fiction books.
fiction_defect_rate (float): Defect rate for fiction books.
non_fiction_defect_rate (float): Defect rate for non-fiction books.

Returns:
int: Total number of books that need rewrapping.

Examples:
>>> books_to_rewrap(45, 35, 0.2, 0.4)
23
>>> books_to_rewrap(45, 35, 0.0, 0.0)
0

Implement `books_to_rewrap(fiction_books: int, non_fiction_books: int, fiction_defect_rate: float, non_fiction_defect_rate: float) -> int`.
