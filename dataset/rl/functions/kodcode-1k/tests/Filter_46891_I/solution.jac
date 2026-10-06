import re;
"""
    Check if the given string is a valid email address.

    Parameters:
    email (str): the string to check.

    Returns:
    str: 'Valid Email' or 'Invalid Email'
    """
def check_email(email: str) -> str {
    regex = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
    if re.match(regex, email) {
        return 'Valid Email';
    } else {
        return 'Invalid Email';
    }
}

