import re;
"""
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
    """
def is_valid_code(code: str) -> bool {
    pattern = r'^[A-Z][0-9]{5}[a-z]{2}$';
    return bool(re.match(pattern, code));
}

