"""
    Returns a string with alphabetic characters reversed and non-alphabetic characters in their original positions

    Parameters:
    input_str (str): The input string containing both alphabetic and non-alphabetic characters

    Returns:
    str: The resulting string with alphabetic characters reversed

    Example:
    >>> custom_string_reverser("a,b$c")
    "c,b$a"

    >>> custom_string_reverser("Ab,c?!De")
    "eD,c?!bA"
    """
def custom_string_reverser(input_str: str) -> str {
    letters = [
        char
        for char in input_str
        if char.isalpha()
    ];
    reversed_letters = letters[::-1];
    result = [];
    letter_index = 0;
    for char in input_str {
        if char.isalpha() {
            result.append(reversed_letters[letter_index]);
            letter_index += 1;
        } else {
            result.append(char);
        }
    }
    return ''.join(result);
}

