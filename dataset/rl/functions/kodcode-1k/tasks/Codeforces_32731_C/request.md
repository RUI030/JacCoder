# can_balance_books

Determines if it is possible to balance the number of books in all genres by redistributing them.

Parameters:
n (int): Number of genres.
genres (list of int): List containing the number of books in each genre.

Returns:
str: "YES" if it is possible to balance, otherwise "NO".

Examples:
>>> can_balance_books(3, [10, 20, 30])
"YES"
>>> can_balance_books(4, [1, 2, 3, 4])
"NO"

Implement `can_balance_books(n: int, genres: list[int]) -> str`.
