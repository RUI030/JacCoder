# compress_string

Compresses the given string by replacing consecutive repeated characters with the character 
followed by the count of repetitions. If the compressed string is not shorter than the original 
string, return the original string.

>>> compress_string("aabcccccaaa")
"a2b1c5a3"
>>> compress_string("abc")
"abc"

Implement `compress_string(s: str) -> str`.
