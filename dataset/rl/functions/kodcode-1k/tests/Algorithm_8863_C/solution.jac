"""
    Function to perform run-length encoding on the input string.

    Parameters:
    s (str): The input string consisting of uppercase alphabetical characters (A-Z).

    Returns:
    str: Run-Length Encoded (RLE) version of the input string.
    """
def encode_rle(s: str) -> str {
    if not s {
        return "";
    }
    encoded_string = [];
    current_char = s[0];
    current_count = 1;
    for char in s[1:] {
        if (char == current_char) {
            current_count += 1;
        } else {
            encoded_string.append(f"{current_char}{current_count}");
            current_char = char;
            current_count = 1;
        }
    }
    encoded_string.append(f"{current_char}{current_count}");
    return ''.join(encoded_string);
}

