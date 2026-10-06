"""
    Computes the sum of all numerical digits in a string, supporting both ASCII and Unicode digit characters.

    Parameters:
    word (str): The input string that may contain ASCII, Unicode digits, letters, and special characters.

    Returns:
    int: The sum of all digits in the input string.
    """
def unicode_digit_sum(word: str) -> int {
    total = 0;
    for char in word {
        if char.isdigit() {
            total += int(char);
        }
    }
    return total;
}

