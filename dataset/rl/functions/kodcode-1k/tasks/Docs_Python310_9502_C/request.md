# process_strings

Process a list of strings to find unique strings and their longest consecutive occurrences.

>>> process_strings(["apple", "apple", "banana", "apple", "apple", "apple", "banana", "banana", "cherry"])
[("apple", 2), ("banana", 1), ("apple", 3), ("banana", 2), ("cherry", 1)]
>>> process_strings(["a", "a", "b", "!", "!", "!"])
[("a", 2), ("b", 1), ("!", 3)]

Implement `process_strings(strings_list: list[str]) -> list[tuple[str, int]]`.
