# consecutiveCounts

Given a string containing lowercase alphabetic characters, write a function to count the number of sequences of identical consecutive characters and return an array where each index holds the count of respective sequences found in the string.

For example:

    consecutiveCounts("aaabbcc") => [3, 2, 2]
    consecutiveCounts("abcd") => [1, 1, 1, 1]
    consecutiveCounts("aabbbcccddd") => [2, 3, 3, 3]
    consecutiveCounts("") => []

The function should handle a string with up to 1000 characters.

Example:
- `consecutiveCounts('aaabbcc') == [3, 2, 2]`

Implement `consecutiveCounts(s: str) -> list[int]`.
