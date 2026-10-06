"""
    Convert a Roman numeral to an integer.

    :param s: A string representing the Roman numeral.
    :return: An integer representation of the Roman numeral.
    """
def roman_to_int(s: str) -> int {
    roman_to_int_map = {
        'I': 1,
        'V': 5,
        'X': 10,
        'L': 50,
        'C': 100,
        'D': 500,
        'M': 1000
    };
    integer_value = 0;
    prev_value = 0;
    for char in reversed(s) {
        current_value = roman_to_int_map[char];
        if (current_value < prev_value) {
            integer_value -= current_value;
        } else {
            integer_value += current_value;
        }
        prev_value = current_value;
    }
    return integer_value;
}

