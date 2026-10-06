# validate_string

Check whether the given string matches specific criteria.

The criteria are:
1. The string should start with an uppercase letter.
2. The string should contain exactly one digit (0-9), and this digit should appear exactly in the middle of the string.
3. The string should end with three lowercase letters.

>>> validate_string("A1abc") == True
>>> validate_string("B12xyz") == False

Implement `validate_string(input_string: str) -> bool`.
