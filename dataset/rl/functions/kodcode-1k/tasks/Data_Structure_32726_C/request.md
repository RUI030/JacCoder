# num_decodings

Determines the total number of ways to decode an encoded message.

The message is encoded using the following scheme:
'A' -> 1
'B' -> 2
...
'Z' -> 26

The encoded message consists of a string of digits. 

>>> num_decodings("12")
2
>>> num_decodings("226")
3

Implement `num_decodings(encoded_message: str) -> int`.
