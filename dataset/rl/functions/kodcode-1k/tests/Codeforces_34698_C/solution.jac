"""
    Takes a list of integers and converts valid ASCII values to a string.
    Characters in the ASCII range of 32 to 126 inclusive are considered valid.
    """
def convert_ascii(int_list: list[int]) -> str {
    valid_chars = [
        chr(num)
        for num in int_list
        if (32 <= num <= 126)
    ];
    return ''.join(valid_chars);
}

