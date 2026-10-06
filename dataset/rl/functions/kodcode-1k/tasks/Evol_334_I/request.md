# unique_k_chars

Write a Jac function that takes a string and an integer k as inputs and returns a new string with only the first occurrence of each character in the original string, such that the new string is at most k characters long. If k is greater than the number of unique characters in the original string, the new string should contain all the unique characters. The function should handle both upper and lower case letters and treat them as distinct characters.

Example:

Input: 
"banana", 3

Output: 
"ban"

Input: 
"Programming", 5

Output: 
"Prog"

Example:
- `unique_k_chars('banana', 3) == 'ban'`

Implement `unique_k_chars(s: str, k: int) -> str`.
