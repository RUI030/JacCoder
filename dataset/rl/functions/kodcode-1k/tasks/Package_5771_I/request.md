# check_book_availability

You are implementing a library management system and need to create a function `check_book_availability(book_list, requested_book)` that checks if a requested book is available in the library. The book titles are case insensitive, and the library should also suggest possible matches if the exact book is not found. The specific requirements are as follows:

1. The function should take in two arguments:
    - `book_list`: A list of strings, each representing a book title available in the library.
    - `requested_book`: A string representing the book title being requested by the user.
2. The function should first normalize both `book_list` and `requested_book` to lowercase for case-insensitive comparison.
3. If the exact `requested_book` is found in `book_list`, return the message: "The book '<requested_book>' is available."
4. If the exact `requested_book` is not found, check for partial matches. If any book titles in `book_list` contain the `requested_book` as a substring (case insensitive), return a list of suggested titles in the format: "The book '<requested_book>' is not available. Did you mean: <comma_separated_list_of_suggestions>?"
5. If there are no exact or partial matches, return the message: "The book '<requested_book>' is not available, and no similar titles were found."

You need to implement the `check_book_availability` function to satisfy all the requirements above. Ensure case insensitivity is handled correctly, and the suggestions are formatted appropriately.

Example:
- `check_book_availability(['The Great Gatsby', '1984', 'To Kill a Mockingbird'], '1984') == "The book '1984' is available."`

Implement `check_book_availability(book_list: list[str], requested_book: str) -> str`.
