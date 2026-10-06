"""
    Sorts an array using the Shell Sort algorithm.
    """
def enhanced_shell_sort(arr: list[int]) -> list[int] {
    n = len(arr);
    gap = 1;
    while (gap < (n // 3)) {
        gap = (3 * gap) + 1;
    }
    while (gap > 0) {
        for i in range(gap, n) {
            temp = arr[i];
            j = i;
            while ((j >= gap) and (arr[(j - gap)] > temp)) {
                arr[j] = arr[(j - gap)];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap //= 3;
    }
    return arr;
}

