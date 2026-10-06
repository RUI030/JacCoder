"""
    Removes all the elements in a list that are less than the average of all the elements in the list.
    """
def remove_below_average(lst: list[int]) -> list[int] {
    if not lst {
        return [];
    }
    average = sum(lst) / len(lst);
    return [
        x
        for x in lst
        if (x >= average)
    ];
}

