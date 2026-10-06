import from typing { List }
"""
    Rotates an array of integers to the left by 'd' positions.
    """
def rotate_array(arr: list[int], d: int) -> list[int] {
    n = len(arr);
    if ((n == 0) or ((d % n) == 0)) {
        return arr;
    }
    d = d % n;
    return (arr[d:] + arr[:d]);
}

