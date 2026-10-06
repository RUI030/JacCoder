"""
    Finds the longest word in the given string that uses only the first 10 letters of the English alphabet ('a' through 'j').
    If there are multiple longest words, returns the first one found.
    """
def longest_valid_word(s: str) -> str {
    valid_chars = `set('abcdefghij');
    filtered_s = ''.join(
        [char if ((char in valid_chars) or char.isspace()) else ' ' for char in s]
    );
    words = filtered_s.split();
    longest_word = "";
    for word in words {
        if (len(word) > len(longest_word)) {
            longest_word = word;
        }
    }
    return longest_word;
}

