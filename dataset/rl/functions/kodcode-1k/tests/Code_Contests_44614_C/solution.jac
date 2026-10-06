"""
    Determines if it's possible to arrange n books on k shelves
    where each shelf has at least one book, no two shelves have the same number of books,
    and the shelves are ordered in non-decreasing order of the number of books they hold.
    """
def can_arrange_books(n: int, k: int) -> str {
    min_books_needed = (k * (k + 1)) // 2;
    if (n >= min_books_needed) {
        return "YES";
    } else {
        return "NO";
    }
}

