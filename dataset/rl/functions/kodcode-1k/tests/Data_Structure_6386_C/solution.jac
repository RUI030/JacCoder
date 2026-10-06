import from typing { List }
"""
    Given an array of integers, computes the Euler Totient Function for each integer in the array.

    Parameters:
    arr (List[int]): A list of integers.

    Returns:
    List[int]: A list of ϕ(n) corresponding to each integer in the input array.
    """
def compute_totients(arr: list[int]) -> list[int] {
    max_n = max(arr);
    phi = `list(range((max_n + 1)));
    for i in range(2, (max_n + 1)) {
        if (phi[i] == i) {
            for j in range(i, (max_n + 1), i) {
                phi[j] = (phi[j] * (i - 1)) // i;
            }
        }
    }
    result = [phi[num] for num in arr];
    return result;
}

