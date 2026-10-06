"""
    Returns the characters that appear exactly once in the string s,
    in the order they appear.

    Params:
    s (str): Input string containing only lowercase letters and spaces.

    Returns:
    List[str]: List of characters that are unique in the input string.
    """
def find_unique_characters(s: str) -> list[str] {
    import from collections { Counter }
    count = Counter(s);
    return [
        char
        for char in s
        if (count[char] == 1)
    ];
}

