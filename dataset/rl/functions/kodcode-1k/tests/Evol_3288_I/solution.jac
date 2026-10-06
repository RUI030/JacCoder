"""
    Sort the alphabetic characters in ascending order while keeping the numbers in their original positions.

    :param s: A string containing a mix of alphabetic characters and numbers
    :return: A string with sorted alphabetic characters and original-position numbers
    """
def sort_letters_keep_numbers(s: str) -> str {
    letters = sorted(
        [
            char
            for char in s
            if char.isalpha()
        ]
    );
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

