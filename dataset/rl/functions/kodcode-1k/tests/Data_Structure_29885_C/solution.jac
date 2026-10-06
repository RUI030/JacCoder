"""
    Returns the next higher number that has the exact same set of digits as num.
    If no such number exists, return -1.
    """
def next_bigger(num: int) -> int {
    num_list = `list(str(num));
    length = len(num_list);
    for i in range((length - 2), -1, -1) {
        if (num_list[i] < num_list[(i + 1)]) {
            break;
        }
    } else {
        return -1;
    }
    for j in range((length - 1), i, -1) {
        if (num_list[j] > num_list[i]) {
            break;
        }
    }
    (num_list[i], num_list[j]) = (num_list[j], num_list[i]);
    num_list = num_list[:(i + 1)] + num_list[(i + 1):][::-1];
    return int("".join(num_list));
}

