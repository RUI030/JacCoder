# encode_rle

Perform run-length encoding on the input string.

Run-Length Encoding is a simple form of data compression where 
consecutive occurrences of the same character are replaced 
by a single character followed by the count of its occurrences.

Parameters:
s (str): The input string consisting of uppercase alphabetical characters (A-Z).

Returns:
str: Run-Length Encoded (RLE) version of the input string.

Examples:
>>> encode_rle("AAAABBBCCDAA")
"A4B3C2D1A2"

>>> encode_rle("ABCD")
"A1B1C1D1"

Implement `encode_rle(s: str) -> str`.
