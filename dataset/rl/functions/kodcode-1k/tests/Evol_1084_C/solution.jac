"""
    Returns the length of the shortest word in the string s.
    """
def length_of_shortest_word(s: str) -> int {
    words = s.split();
    if not words {
        return 0;
    }
    shortest_length = min(len(word) for word in words);
    return shortest_length;
}

