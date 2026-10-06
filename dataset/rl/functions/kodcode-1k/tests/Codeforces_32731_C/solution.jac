"""
    Determines if it is possible to balance the number of books in all genres by redistributing them.

    Parameters:
    n (int): Number of genres.
    genres (list of int): List containing the number of books in each genre.

    Returns:
    str: "YES" if it is possible to balance, otherwise "NO".
    """
def can_balance_books(n: int, genres: list[int]) -> str {
    total_books = sum(genres);
    if ((total_books % n) == 0) {
        return "YES";
    } else {
        return "NO";
    }
}

