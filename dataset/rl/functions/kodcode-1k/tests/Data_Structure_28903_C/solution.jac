"""
    Sorts an array of integers which can include negative numbers using the Counting Sort algorithm.
    """
def custom_counting_sort(arr: list[int]) -> list[int] {
    if not arr {
        return arr;
    }
    min_val = min(arr);
    max_val = max(arr);
    count_range = (max_val - min_val) + 1;
    count = [0] * count_range;
    for num in arr {
        count[(num - min_val)] += 1;
    }
    sorted_index = 0;
    for i in range(count_range) {
        while (count[i] > 0) {
            arr[sorted_index] = i + min_val;
            sorted_index += 1;
            count[i] -= 1;
        }
    }
    return arr;
}

