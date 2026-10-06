# is_valid_code

Validate the access code based on specific rules.

The rules are:
1. The access code must be exactly 8 characters long.
2. It should start with 1 uppercase letter.
3. Followed by 5 digits (0-9).
4. Ends with 2 lowercase letters.

Parameters:
- code (str): The access code to be validated.

Returns:
- bool: True if the access code is valid, False otherwise.

>>> is_valid_code("A12345bc")
True
>>> is_valid_code("A1234bc")
False

Implement `is_valid_code(code: str) -> bool`.
