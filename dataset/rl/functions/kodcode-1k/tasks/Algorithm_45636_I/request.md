# can_form_palindrome

### Palindrome Permutation

Design a function that determines if any permutation of a given string can form a palindrome. A palindrome is a word, phrase, or sequence of characters which reads the same forward and backward (ignoring spaces and punctuation). Your function should consider only alphanumeric characters and ignore the case of these characters.

**Function Signature**: `def can_form_palindrome(s: str) -> bool:`

### Requirements:
1. Ignore spaces, punctuation, and case when determining if characters can be permuted to form a palindrome.
2. A string can form a palindrome if at most one character occurs an odd number of times.

### Input and Output Formats:
* **Input**: A single string `s` consisting of alphanumeric characters, spaces, and punctuation. `s` can be an empty string.
* **Output**: A boolean value indicating whether any permutation of the string can form a palindrome.

### Constraints:
* The input string can have a length between 0 and 1000 characters.

### Examples:
1. `can_form_palindrome("Tact Coa")` should return `True` because "Tact Coa" can be permuted to "taco cat", which is a palindrome.
2. `can_form_palindrome("A man, a plan, a canal, Panama!")` should return `True` because "A man, a plan, a canal, Panama!" can be permuted to "amanap lanac a nalp a nam A", which is a palindrome.
3. `can_form_palindrome("hello")` should return `False` because no permutation of "hello" can form a palindrome.
4. `can_form_palindrome("")` should return `True` because an empty string is trivially a palindrome.

Remember to handle edge cases such as empty strings, single characters, and strings with a mix of uppercase, lowercase, spaces, and punctuation. Ensure your solution is efficient and correctly handles various input scenarios.

Example:
- `can_form_palindrome('') == True`

Implement `can_form_palindrome(s: str) -> bool`.
