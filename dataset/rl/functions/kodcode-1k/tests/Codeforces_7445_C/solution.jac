def longest_contiguous_subarray(t: int, test_cases: list[tuple[int, list[int]]]) -> list[int] {
    result = [];
    for i in range(t) {
        (n, arr) = test_cases[i];
        if (n == 1) {
            result.append(1);
            continue;
        }
        max_len = 1;
        cur_len = 1;
        for j in range(1, n) {
            if (arr[j] > arr[(j - 1)]) {
                cur_len += 1;
            } else {
                max_len = max(max_len, cur_len);
                cur_len = 1;
            }
        }
        max_len = max(max_len, cur_len);
        cur_len = 1;
        for j in range(1, n) {
            if (arr[j] < arr[(j - 1)]) {
                cur_len += 1;
            } else {
                max_len = max(max_len, cur_len);
                cur_len = 1;
            }
        }
        max_len = max(max_len, cur_len);
        result.append(max_len);
    }
    return result;
}

