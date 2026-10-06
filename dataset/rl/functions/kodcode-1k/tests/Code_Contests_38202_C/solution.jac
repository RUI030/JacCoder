"""
    Converts a binary string to its original string of characters.
    Each character in the original string is represented by 8 bits in the binary string.

    Args:
    binary_str (str): A binary string of length divisible by 8.

    Returns:
    str: The original string of characters.
    """
def binary_to_string(binary_str: str) -> str {
    num_chunks = len(binary_str) // 8;
    chars = [];
    for i in range(num_chunks) {
        byte = binary_str[(i * 8):((i + 1) * 8)];
        ascii_value = int(byte, 2);
        char = chr(ascii_value);
        chars.append(char);
    }
    return ''.join(chars);
}

