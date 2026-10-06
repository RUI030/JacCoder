"""
    Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
    """
def search_substring(haystack: str, needle: str) -> int {
    if (needle == "") {
        return 0;
    }
    return haystack.find(needle);
}

