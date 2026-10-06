# can_form_palindrome

#### Context
In the context of computer science, a palindrome is a string that reads the same forward and backward. A more challenging variety of palindrome-related problems involves checking if a string can be re-arranged to form a palindrome. Your task is to write a function that determines if any permutation of the given string is a palindrome.

#### Function Specification
Define a function named `can_form_palindrome` that takes a string `s` as its input and returns a boolean indicating whether any permutation of the string can form a palindrome.

#### Requirements
- The function should be case insensitive (i.e., 'A' and 'a' should be considered as the same character).
- The function should ignore spaces and non-alphanumeric characters.
- If the string can be permuted to form a palindrome, return `True`; otherwise, return `False`.

#### Input
- A string `s` containing alphanumeric characters, spaces, and punctuation.

#### Output
- A boolean value `True` if any permutation of the string can form a palindrome, otherwise `False`.

#### Examples
1. `can_form_palindrome("Tact Coa")` should return `True` because permutations like "tacocat" and "atcocta" are palindromes.
2. `can_form_palindrome("Able was I ere I saw Elba")` should return `True` because permutations like "ablewasi ereisaw elba" are palindromes.
3. `can_form_palindrome("Hello World")` should return `False` because no permutation of the string can form a palindrome.

Example:
- `can_form_palindrome('Tact Coa') == True`

Implement `can_form_palindrome(s: str) -> bool`.
