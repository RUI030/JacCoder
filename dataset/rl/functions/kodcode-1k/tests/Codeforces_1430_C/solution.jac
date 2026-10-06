"""
    Constructs an array b such that for each integer c in a, its position in b is the count of numbers in a that are less than c.

    :param n: Number of integers
    :param a: List of n distinct integers
    :return: List of integers representing the counts of numbers less than each element in array a
    """
def count_less_than_elements(n: int, a: list[int]) -> list[int] {
    b = [];
    for i in range(n) {
        count = sum(
            1
            for x in a
            if (x < a[i])
        );
        b.append(count);
    }
    return b;
}

