import from typing { List }
import bisect;
def find_lis_length(sequence: list[int]) -> int {
    if not sequence {
        return 0;
    }
    lis = [];
    for number in sequence {
        pos = bisect.bisect_left(lis, number);
        if (pos == len(lis)) {
            lis.append(number);
        } else {
            lis[pos] = number;
        }
    }
    return len(lis);
}

