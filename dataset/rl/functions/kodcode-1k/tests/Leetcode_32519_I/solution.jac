"""
    Returns the length of the longest substring that contains only vowels
    and does not have the same consecutive characters.
    """
def longest_vowel_substring(s: str) -> int {
    vowels = `set('aeiou');
    max_length = 0;
    current_length = 0;
    prev_char = '';
    for char in s {
        if (char in vowels) {
            if (char != prev_char) {
                current_length += 1;
            } else {
                current_length = 1;
            }
            prev_char = char;
        } else {
            current_length = 0;
            prev_char = '';
        }
        max_length = max(max_length, current_length);
    }
    return max_length;
}

