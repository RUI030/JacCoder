def isMountainArray(arr: list[int]) -> bool {
    n = len(arr);
    if (n < 3) {
        return False;
    }
    peak_index = 0;
    for i in range(1, (n - 1)) {
        if ((arr[i] > arr[(i - 1)]) and (arr[i] > arr[(i + 1)])) {
            peak_index = i;
            break;
        }
    }
    if (peak_index == 0) {
        return False;
    }
    for i in range(1, (peak_index + 1)) {
        if (arr[i] <= arr[(i - 1)]) {
            return False;
        }
    }
    for i in range((peak_index + 1), n) {
        if (arr[i] >= arr[(i - 1)]) {
            return False;
        }
    }
    return True;
}

