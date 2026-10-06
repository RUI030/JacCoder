import from typing { List }
"""
    Rotates the array to the right by k steps.

    :param arr: List of integers to be rotated.
    :param k: Number of right rotations.
    :return: The array after k right rotations.
    """
def circular_array_rotation(arr: list[int], k: int) -> list[int] {
    n = len(arr);
    if (n == 0) {
        return arr;
    }
    k = k % n;
    return (arr[-k:] + arr[:-k]);
}

