"""
    Recursively reverses the given string `s`.
    """
def custom_reverse(s: str) -> str {
    if (len(s) <= 1) {
        return s;
    }
    return (s[-1] + custom_reverse(s[:-1]));
}

