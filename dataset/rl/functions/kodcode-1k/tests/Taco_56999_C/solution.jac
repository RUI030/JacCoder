"""
    Counts the number of valid pairs such that A[i] + B[j] = X.

    Parameters:
    N (int): Number of elements in each array.
    X (int): The target sum.
    A (list of int): The array A of integers.
    B (list of int): The array B of integers.

    Returns:
    int: Number of valid pairs.
    """
def count_valid_pairs(N: int, X: int, A: list[int], B: list[int]) -> int {
    count = 0;
    B_set = `set(B);
    for a in A {
        if ((X - a) in B_set) {
            count += 1;
        }
    }
    return count;
}

