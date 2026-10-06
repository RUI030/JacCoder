"""
    Returns a new string with all the uppercase letters coming before all the lowercase letters,
    preserving the original relative order of the letters within each group.
    """
def sortStringByCase(s: str) -> str {
    uppercase = [
        char
        for char in s
        if char.isupper()
    ];
    lowercase = [
        char
        for char in s
        if char.islower()
    ];
    return ''.join((uppercase + lowercase));
}

