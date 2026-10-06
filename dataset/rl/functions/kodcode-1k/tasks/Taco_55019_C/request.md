# validate_username

Validate the given username based on the following rules:
- The username must contain only lowercase English letters.
- The username must be between 6 and 15 characters long.
- The username must not contain three consecutive identical characters.
- The username must not have more than 3 characters in increasing or decreasing consecutive order.

Args:
username (str): The username string to be validated.

Returns:
str: "Valid" if the username meets all the rules, otherwise "Invalid".

Examples:
>>> validate_username("johnsmith")
"Valid"

>>> validate_username("aab_cdefg")
"Invalid"

Implement `validate_username(username: str) -> str`.
