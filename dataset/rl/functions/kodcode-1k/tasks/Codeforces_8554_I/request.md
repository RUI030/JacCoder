# rearrange_string

You are given a string consisting of lowercase Latin letters and digits. Your task is to rearrange the characters of the string such that the letters appear in alphabetical order and the digits appear in ascending order. The digits should be placed before the letters in the resulting string.

For example, given the string "c2a1b3", the result should be "123abc".

Note: If the input string contains only letters or only digits, the output should be the same as the input string but sorted accordingly.

### Input
The input consists of a single string containing lowercase Latin letters ('a' to 'z') and digits ('0' to '9'). The length of the string will be between 1 and 10^5.

### Output
Print the rearranged string with digits in ascending order followed by letters in alphabetical order.

### Examples

**Example 1:**

Input: "b3a1c2"

Output: "123abc"

**Example 2:**

Input: "abc123"

Output: "123abc"

**Example 3:**

Input: "54321"

Output: "12345"

**Example 4:**

Input: "xyz"

Output: "xyz"

**Example 5:**

Input: "z9a8b7c6"

Output: "6789abcz"

Example:
- `rearrange_string('b3a1c2') == '123abc'`

Implement `rearrange_string(s: str) -> str`.
