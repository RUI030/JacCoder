"""
    Returns a string where every letter in the input string `s` is reversed,
    but the position of the digits is preserved.
    """
def reverse_letters(s: str) -> str {
    letters = [
        char
        for char in s
        if char.isalpha()
    ][::-1];
    result = [];
    letter_index = 0;
    for char in s {
        if char.isalpha() {
            result.append(letters[letter_index]);
            letter_index += 1;
        } else {
            result.append(char);
        }
    }
    return ''.join(result);
}

