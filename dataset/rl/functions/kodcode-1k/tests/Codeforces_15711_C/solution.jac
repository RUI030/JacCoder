"""
    Returns the longest palindromic word in the text.
    If no palindrome exists, returns an empty string.
    """
def longest_palindromic_word(text: str) -> str {
    words = text.split();
    longest_palindrome = "";
    for word in words {
        if (word == word[::-1]) {
            if (len(word) > len(longest_palindrome)) {
                longest_palindrome = word;
            }
        }
    }
    return longest_palindrome;
}

