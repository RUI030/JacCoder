"""
    Function to sort an array using Shell Sort algorithm.
    """
def shell_sort(arr: list[int]) -> list[int] {
    n = len(arr);
    gap = n // 2;
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
        gap //= 2;
    }
    return arr;
}

