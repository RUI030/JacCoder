import from typing { Any }
"""
    Sorts a list of books by their edition number in ascending order
    while maintaining the original order in case of ties.

    Parameters:
    books (list of tuples): List containing tuples where each tuple
                            has an integer (edition number) and a string (book title).

    Returns:
    list of tuples: A new list sorted by the edition number.
    """
def sort_books_by_edition(books: list[tuple[int, str]]) -> list[tuple[int, str]] {
    return sorted(books, key=lambda (book: Any) { book[0]; });
}

