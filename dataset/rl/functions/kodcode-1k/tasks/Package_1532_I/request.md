# can_form_palindrome

**Context:** You need to write a function that determines whether a given string can be permuted to form a palindrome. A palindrome is a string that reads the same backward as forward. Your function should utilize a hash map to count the frequency of each character in the input string and then determine if the string can be rearranged to form a palindrome.

**Function Name:** `can_form_palindrome`

**Input:**
- A string `s` (1 <= len(s) <= 10^5), consisting of lower case English letters.

**Output:**
- A boolean value: `True` if the string can be permuted to form a palindrome, `False` otherwise.

**Requirements:**
- Use a dictionary to count the occurrences of each character in the string.
- Ensure that the logic for palindrome formation is implemented by checking the character counts.

### Example

#### Example 1:
- **Input:** `s = "civic"`
- **Output:** `True`
- **Explanation:** The string "civic" is already a palindrome.

#### Example 2:
- **Input:** `s = "ivicc"`
- **Output:** `True`
- **Explanation:** The string "ivicc" can be permuted to form "civic", which is a palindrome.

#### Example 3:
- **Input:** `s = "hello"`
- **Output:** `False`
- **Explanation:** The string "hello" cannot be rearranged to form a palindrome.

The function should correctly assess if any permutation of the input string can result in a palindrome by leveraging appropriate hash map logic.

Example:
- `can_form_palindrome('civic') == True`

Implement `can_form_palindrome(s: str) -> bool`.
