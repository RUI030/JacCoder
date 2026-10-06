# group_strings_by_length

Write a Jac function that takes a list of strings as input and returns a dictionary. The dictionary should have keys as the lengths of the strings and values as lists of strings that correspond to those lengths. Ensure your function is efficient and handles edge cases appropriately, such as an empty list or strings with the same length. For instance, given the input `["abc", "de", "fgh", "i", "jk", "lmno"]`, the function should return `{1: ["i"], 2: ["de", "jk"], 3: ["abc", "fgh"], 4: ["lmno"]}`.

Example:
- `group_strings_by_length(['abc', 'de', 'fgh', 'i', 'jk', 'lmno']) == {1: ['i'], 2: ['de', 'jk'], 3: ['abc', 'fgh'], 4: ['lmno']}`

Implement `group_strings_by_length(strings: list[str]) -> dict[int, list[str]]`.
