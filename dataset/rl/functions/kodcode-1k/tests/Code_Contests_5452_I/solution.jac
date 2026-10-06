"""
    Determines if all elements of the array can be made zero by flipping subarrays of length k.
    """
def can_all_elements_be_zero(n: int, k: int, arr: list[int]) -> str {
    flips = 0;
    for i in range(n) {
        if (arr[i] == 1) {
            if ((i + k) <= n) {
                flips += 1;
                for j in range(k) {
                    arr[(i + j)] = 1 - arr[(i + j)];
                }
            } else {
                return "NO";
            }
        }
    }
    return "YES";
}

