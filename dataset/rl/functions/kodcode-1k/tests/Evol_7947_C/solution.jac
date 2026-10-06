"""
    Calculate the total number of books that need rewrapping.

    Parameters:
    fiction_books (int): Number of fiction books.
    non_fiction_books (int): Number of non-fiction books.
    fiction_defect_rate (float): Defect rate for fiction books.
    non_fiction_defect_rate (float): Defect rate for non-fiction books.

    Returns:
    int: Total number of books that need rewrapping.
    """
def books_to_rewrap(fiction_books: int, non_fiction_books: int, fiction_defect_rate: float, non_fiction_defect_rate: float) -> int {
    fiction_defect_books = fiction_books * fiction_defect_rate;
    non_fiction_defect_books = non_fiction_books * non_fiction_defect_rate;
    total_defects = fiction_defect_books + non_fiction_defect_books;
    return int(total_defects);
}
with entry {
    fiction_books = 45;
    non_fiction_books = 35;
    fiction_defect_rate = 0.2;
    non_fiction_defect_rate = 0.4;
    books_needing_rewrap = books_to_rewrap(
        fiction_books, non_fiction_books, fiction_defect_rate, non_fiction_defect_rate
    );
    books_needing_rewrap;
}

