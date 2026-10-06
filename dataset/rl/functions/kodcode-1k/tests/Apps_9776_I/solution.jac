"""
    Determines if the requested rental periods do not exceed the respective maximum rental durations.

    Parameters:
    max_durations (list of int): List of maximum rental durations for each book.
    requested_rentals (list of int): List of requested rental periods for the books to be rented.

    Returns:
    str: 'YES' if all requests can be satisfied, 'NO' otherwise.
    """
def can_rent_books(max_durations: list[int], requested_rentals: list[int]) -> str {
    for i in range(len(requested_rentals)) {
        if (requested_rentals[i] > max_durations[i]) {
            return "NO";
        }
    }
    return "YES";
}

