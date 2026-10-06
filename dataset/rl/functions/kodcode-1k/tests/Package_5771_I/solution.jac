"""
    Checks if a requested book is available in the library and suggests possible matches if not found.

    :param book_list: List of book titles available in the library
    :param requested_book: The book title being requested
    :return: A message indicating the availability of the book or suggesting similar titles
    """
def check_book_availability(book_list: list[str], requested_book: str) -> str {
    normalized_books = [book.lower() for book in book_list];
    requested_book_lower = requested_book.lower();
    if (requested_book_lower in normalized_books) {
        return f"The book '{requested_book}' is available.";
    }
    partial_matches = [
        book
        for book in book_list
        if (requested_book_lower in book.lower())
    ];
    if partial_matches {
        suggestions = ", ".join(partial_matches);
        return f"The book '{requested_book}' is not available. Did you mean: {suggestions}?";
    } else {
        return f"The book '{requested_book}' is not available, and no similar titles were found.";
    }
}

