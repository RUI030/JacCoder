"""
    Replaces all 'a's with 'b's and all 'b's with 'a's in the input string.
    The function is case-sensitive.

    Args:
    input_string (str): The input string.

    Returns:
    str: The modified string with 'a's and 'b's swapped.
    """
def swap_a_b(input_string: str) -> str {
    swapped_string = "";
    for char in input_string {
        if (char == 'a') {
            swapped_string += 'b';
        } elif (char == 'b') {
            swapped_string += 'a';
        } else {
            swapped_string += char;
        }
    }
    return swapped_string;
}

