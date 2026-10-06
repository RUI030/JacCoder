import from typing { Any }
"""
    Returns the most frequent character in the input string (ignoring spaces and case-insensitive)
    and the count of its occurrences in a tuple (char, frequency).
    """
def find_most_frequent_char(input_str: str) -> tuple[str, int] {
    import from collections { Counter }
    normalized_str = input_str.replace(" ", "").lower();
    char_count = Counter(normalized_str);
    most_frequent_char = max(char_count, key=lambda (char: Any) { char_count[char]; });
    frequency = char_count[most_frequent_char];
    return (most_frequent_char, frequency);
}

