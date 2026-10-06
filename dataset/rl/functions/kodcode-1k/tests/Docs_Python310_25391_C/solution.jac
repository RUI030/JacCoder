"""
    Concatenates the bytearray equivalent of `str1` and `str2`,
    resizes the resulting bytearray to the size of `str1`, and
    returns the string representation of the modified bytearray.
    """
def manipulate_bytearrays(str1: str, str2: str) -> str {
    ba1 = bytearray(str1, 'utf-8');
    ba2 = bytearray(str2, 'utf-8');
    concatenated = ba1 + ba2;
    concatenated = concatenated[:len(str1)];
    return concatenated.decode('utf-8');
}

