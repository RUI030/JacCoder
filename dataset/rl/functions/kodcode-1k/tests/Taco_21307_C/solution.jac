def max_sum_of_non_overlapping_positive_subarrays(arr: list[int]) -> int {
    max_sum = 0;
    current_sum = 0;
    for num in arr {
        if (num > 0) {
            current_sum += num;
        } else {
            if (current_sum > 0) {
                max_sum += current_sum;
            }
            current_sum = 0;
        }
    }
    if (current_sum > 0) {
        max_sum += current_sum;
    }
    return max_sum;
}

