# find_most_frequent_char

You are asked to create a function `find_most_frequent_char` that determines the most frequent character in a given string. If there are multiple characters with the same highest frequency, the function should return the one that appears first in the string. The function should ignore spaces and be case-insensitive.

The function will take one parameter:

1. `input_str`: A string containing the input text which may include letters (both uppercase and lowercase), digits, punctuation, and spaces.

The function should return a tuple `(char, frequency)`, where `char` is the most frequent character and `frequency` is the count of its occurrences.

To solve this problem, consider using a dictionary to count the occurrences of each character, converting the string to lowercase and ignoring spaces.

Implement the function `find_most_frequent_char(input_str)` ensuring it adheres to the described requirements.

Example:
- `find_most_frequent_char('a') == ('a', 1)`

Implement `find_most_frequent_char(input_str: str) -> tuple[str, int]`.
