import from typing { List }
def find_optimal_index(binary_array: list[int]) -> int {
    max_len = 0;
    max_index = -1;
    current_len = 0;
    prev_zero_index = -1;
    prev_len = 0;
    for (i, num) in enumerate(binary_array) {
        if (num == 1) {
            current_len += 1;
        } else {
            if (prev_zero_index != -1) {
                if ((current_len + prev_len + 1) > max_len) {
                    max_len = current_len + prev_len + 1;
                    max_index = prev_zero_index;
                }
            }
            prev_len = current_len;
            current_len = 0;
            prev_zero_index = i;
        }
    }
    if (prev_zero_index != -1) {
        if ((current_len + prev_len + 1) > max_len) {
            max_len = current_len + prev_len + 1;
            max_index = prev_zero_index;
        }
    }
    if ((max_index == -1) and (0 in binary_array)) {
        return binary_array.index(0);
    }
    return max_index;
}

