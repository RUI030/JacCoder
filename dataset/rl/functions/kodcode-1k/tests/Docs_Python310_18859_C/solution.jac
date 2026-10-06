"""
    Concatenates bytearrays of specified lengths and resizes to the final length.

    Parameters:
    - string_length_pairs (List[Tuple[str, int]]): List of tuples containing a string and its length.
    - final_length (int): The desired length of the resulting bytearray.

    Returns:
    - str: String representation of the resized bytearray.
    """
def process_bytearrays(string_length_pairs: list[tuple[str, int]], final_length: int) -> str {
    total_bytes = bytearray();
    for (s, length) in string_length_pairs {
        total_bytes.extend(s.encode('utf-8')[:length]);
    }
    if (final_length < len(total_bytes)) {
        total_bytes = total_bytes[:final_length];
    } else {
        total_bytes.extend((b'\x00' * (final_length - len(total_bytes))));
    }
    return total_bytes.decode('utf-8', 'ignore');
}

