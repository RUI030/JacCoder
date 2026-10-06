"""
    Returns the count of distinct integers in every contiguous subarray of length k.
    """
def count_distinct_in_subarrays(arr: list[int], n: int, k: int) -> list[int] {
    if (k > n) {
        return [];
    }
    result = [];
    frequency = {};
    distinct_count = 0;
    for i in range(k) {
        if (arr[i] not in frequency) {
            frequency[arr[i]] = 0;
        }
        frequency[arr[i]] += 1;
        if (frequency[arr[i]] == 1) {
            distinct_count += 1;
        }
    }
    result.append(distinct_count);
    for i in range(k, n) {
        if (frequency[arr[(i - k)]] == 1) {
            distinct_count -= 1;
        }
        frequency[arr[(i - k)]] -= 1;
        if ((arr[i] not in frequency) or (frequency[arr[i]] == 0)) {
            frequency[arr[i]] = 0;
            distinct_count += 1;
        }
        frequency[arr[i]] += 1;
        result.append(distinct_count);
    }
    return result;
}

