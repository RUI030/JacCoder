"""
    Finds the smallest integer m such that any integer between 1 and m (inclusive)
    can be written as the sum of one or more distinct elements from arr.
    """
def smallest_m(arr: list[int]) -> int {
    arr.sort();
    m = 1;
    for num in arr {
        if (num > m) {
            break;
        }
        m += num;
    }
    return m;
}

