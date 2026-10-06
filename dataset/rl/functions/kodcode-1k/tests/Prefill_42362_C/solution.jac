"""
    Sorts a list of integers using the counting sort algorithm.
    """
def counting_sort(arr: list[int]) -> list[int] {
    if not arr {
        return [];
    }
    max_val = max(arr);
    min_val = min(arr);
    range_of_elements = (max_val - min_val) + 1;
    count_arr = [0] * range_of_elements;
    output_arr = [0] * len(arr);
    for number in arr {
        count_arr[(number - min_val)] += 1;
    }
    for i in range(1, len(count_arr)) {
        count_arr[i] += count_arr[(i - 1)];
    }
    for i in range((len(arr) - 1), -1, -1) {
        output_arr[(count_arr[(arr[i] - min_val)] - 1)] = arr[i];
        count_arr[(arr[i] - min_val)] -= 1;
    }
    return output_arr;
}

