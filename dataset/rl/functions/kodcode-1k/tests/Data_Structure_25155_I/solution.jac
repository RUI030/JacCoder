"""
    Sorts the array 'arr' using the Pigeonhole Sorting technique.

    :param arr: List[int] - List of integers possibly containing negative values.
    :return: List[int] - The input list sorted in non-decreasing order.
    """
def pigeonhole_sort(arr: list[int]) -> list[int] {
    if (len(arr) == 0) {
        return [];
    }
    min_value = min(arr);
    max_value = max(arr);
    range_of_values = (max_value - min_value) + 1;
    holes = [[] for _ in range(range_of_values)];
    for num in arr {
        holes[(num - min_value)].append(num);
    }
    sorted_arr = [];
    for hole in holes {
        for num in hole {
            sorted_arr.append(num);
        }
    }
    return sorted_arr;
}

