"""
    Determines if string s can be transformed into string t by changing any character in s to any other character.

    Since we can change any character in s to any character,
    we can transform s to t as long as their lengths are the same,
    which is specified in the problem statement.
    """
def can_transform(s: str, t: str) -> bool {
    return (len(s) == len(t));
}

