# filter_strings_by_length_and_content

What is the most efficient way to write a Jac function that takes a list of strings and an integer `k`, and returns a new list containing only the strings that are exactly `k` characters long? The function should also ignore any strings that contain numbers or special characters, only keeping those that are composed entirely of letters. If the list is empty or contains no valid strings, the function should return an empty list.

Example:
- `filter_strings_by_length_and_content(['apple', 'banana', 'kiwi', 'grape'], 5) == ['apple', 'grape']`

Implement `filter_strings_by_length_and_content(lst: list[str], k: int) -> list[str]`.
