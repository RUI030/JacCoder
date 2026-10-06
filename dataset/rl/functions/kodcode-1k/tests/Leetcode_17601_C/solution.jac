"""
    Determines if string `s` can be converted into string `t` by
    rearranging any substrings of `s` any number of times.
    """
def can_convert_by_rearranging(s: str, t: str) -> bool {
    import from collections { Counter }
    return (Counter(s) == Counter(t));
}

