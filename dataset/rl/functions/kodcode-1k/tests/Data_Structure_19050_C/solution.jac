import from typing { List }
def reorganize_list(lst: list[int], N: int) -> list[int] {
    count = {};
    result = [];
    for num in lst {
        if (num not in count) {
            count[num] = 0;
        }
        if (count[num] < N) {
            result.append(num);
            count[num] += 1;
        }
    }
    return result;
}

