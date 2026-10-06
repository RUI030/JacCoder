"""
    Returns the index of the first occurrence of `needle` in `haystack`, or -1 if `needle`
    is not part of `haystack`.
    """
def contain_string(haystack: str, needle: str) -> int {
    return haystack.find(needle);
}

