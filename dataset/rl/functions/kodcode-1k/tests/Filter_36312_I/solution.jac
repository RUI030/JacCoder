"""
    Takes in a list of numbers and returns a list of the same numbers,
    but sorted in descending order and with duplicates removed.
    """
def sort_and_deduplicate(numbers: list[int]) -> list[int] {
    return sorted(`set(numbers), reverse=True);
}

