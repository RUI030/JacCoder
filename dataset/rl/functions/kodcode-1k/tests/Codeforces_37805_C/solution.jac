"""
    Validates the given string s as a valid email address.

    Args:
    s (str): A string potentially representing an email address.

    Returns:
    str: "YES" if the email address is valid, otherwise "NO".
    """
def is_valid_email(s: str) -> str {
    try {
        (local, domain) = s.split('@');
    } except ValueError {
        return "NO";
    }
    if (not local or not domain) {
        return "NO";
    }
    if ('.' not in domain) {
        return "NO";
    }
    domain_parts = domain.split('.');
    if `any((not part.islower() or not part) for part in domain_parts) {
        return "NO";
    }
    return "YES";
}

