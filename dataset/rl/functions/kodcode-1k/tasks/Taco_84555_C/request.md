# track_books

Track unique book titles and their counts in a list of book titles.

    Args:
    t: int - Number of test cases.
    test_cases: List[Tuple[int, List[str]]] - List of test cases where each test case is represented by a tuple 
                containing the number of books and the list of book titles.

    Returns:
    List[str] - Each string in the list represents the unique book titles and their counts for each test case.

    Example:
    >>> track_books(1, [(5, ['harrypotter', 'twilight', 'harrypotter', 'thehobbit', 'twilight'])])
    ['harrypotter 2
twilight 2
thehobbit 1']

    >>> track_books(2, [
        (5, ['harrypotter', 'twilight', 'harrypotter', 'thehobbit', 'twilight']),
        (4, ['gameofthrones', 'becoming', 'gameofthrones', 'dune'])
    ])
    ['harrypotter 2
twilight 2
thehobbit 1', 'gameofthrones 2
becoming 1
dune 1']

Implement `track_books(t: int, test_cases: list[tuple[int, list[str]]]) -> list[str]`.
