"""
    Rearranges characters of the string such that digits appear in ascending order,
    followed by letters in alphabetical order.
    """
def rearrange_string(s: str) -> str {
    digits = sorted(
        [
            char
            for char in s
            if char.isdigit()
        ]
    );
    letters = sorted(
        [
            char
            for char in s
            if char.isalpha()
        ]
    );
    return ''.join((digits + letters));
}

