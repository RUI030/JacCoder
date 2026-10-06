"""
    Converts an integer to its corresponding Roman numeral representation.
    :param num: Integer from 1 to 3999.
    :return: Roman numeral string.
    """
def generateRomanNumerals(num: int) -> str {
    value_pairs = [
        (1000, "M"),
        (900, "CM"),
        (500, "D"),
        (400, "CD"),
        (100, "C"),
        (90, "XC"),
        (50, "L"),
        (40, "XL"),
        (10, "X"),
        (9, "IX"),
        (5, "V"),
        (4, "IV"),
        (1, "I")
    ];
    result = [];
    for (value, roman) in value_pairs {
        while (num >= value) {
            result.append(roman);
            num -= value;
        }
    }
    return "".join(result);
}

