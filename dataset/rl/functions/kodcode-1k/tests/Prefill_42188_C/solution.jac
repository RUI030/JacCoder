"""
    Returns the index of the first occurrence of string in the list.
    If the string is not found, returns -1.
    """
def find_first_occurrence(lst: list[str], string: str) -> int {
    try {
        return lst.index(string);
    } except ValueError {
        return -1;
    }
}

