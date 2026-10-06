# are_anagrams

You are required to check if a given string is an anagram of another string. An anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

To accomplish this, you need to implement a function that performs the following steps:
1. Create a function `are_anagrams(str1, str2)` that takes in two strings, `str1` and `str2`.
2. Normalize both strings by converting them to lowercase and removing any whitespace.
3. Check if both normalized strings have the same set of characters with the same frequencies.

### Function Definition:
- `are_anagrams(str1: str, str2: str) -> bool`

### Example:
- If the inputs are `str1 = "Listen"` and `str2 = "Silent"`, the function should return `True`.
- If the inputs are `str1 = "Triangle"` and `str2 = "Integral"`, the function should return `True`.
- If the inputs are `str1 = "Apple"` and `str2 = "Pineapple"`, the function should return `False`.

### Requirements:
- Convert both strings to lowercase and remove all whitespace before comparison.
- Use any built-in functions or libraries as necessary to achieve the goal efficiently.

### Guidelines:
- Ensure that your function correctly handles edge cases such as empty strings, strings with different lengths, and strings with spaces.

Example:
- `are_anagrams('Listen', 'Silent') == True`

Implement `are_anagrams(str1: str, str2: str) -> bool`.
