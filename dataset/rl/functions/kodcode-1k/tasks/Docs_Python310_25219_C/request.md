# convert_string

Convert a Unicode string to a specified encoding and then decode it back to Unicode.

Args:
    input_string (str): The Unicode string to be converted.
    encoding (str): The encoding format to convert the string to, e.g., 'utf-8', 'ascii', 'latin-1'.

Returns:
    str: The decoded Unicode string, or "Error: Encoding/Decoding failed" if conversion fails.

>>> convert_string("Hello, World!", "utf-8") == "Hello, World!"
>>> convert_string("Привет, мир!", "ascii") == "Error: Encoding/Decoding failed"

Implement `convert_string(input_string: str, encoding: str) -> str`.
