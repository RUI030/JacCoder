"""
    Returns 'YES' if it's possible to rearrange both n and m's digits to create two equal numbers,
    otherwise returns 'NO'.
    """
def can_rearrange_to_equal(n: int, m: int) -> str {
    str_n = str(n);
    str_m = str(m);
    if (sorted(str_n) == sorted(str_m)) {
        return "YES";
    } else {
        return "NO";
    }
}

