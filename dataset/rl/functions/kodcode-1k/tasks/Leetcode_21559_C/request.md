# min_removals_to_k_distinct

Determine the minimum number of characters that need to be removed from the string
so that the remaining characters form at most k distinct characters.

Args:
s (str): The input string consisting of lowercase English letters.
k (int): The maximum number of distinct characters allowed in the resulting string.

Returns:
int: The minimum number of characters to remove to achieve the condition.

>>> min_removals_to_k_distinct("aaabbcc", 2)
2
>>> min_removals_to_k_distinct("abcde", 1)
4

Implement `min_removals_to_k_distinct(s: str, k: int) -> int`.
