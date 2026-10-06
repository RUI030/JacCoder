"""
    Takes a list of integers and returns a new list containing the cumulative sum of the integers.
    """
def cumulative_sum(lst: list[int]) -> list[int] {
    cumsum = [];
    total = 0;
    for num in lst {
        total += num;
        cumsum.append(total);
    }
    return cumsum;
}

