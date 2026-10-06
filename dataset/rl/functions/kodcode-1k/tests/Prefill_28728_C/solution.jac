"""
    Moves elements from commons list to the left side of mylist while maintaining
    the order of elements not in the commons list.
    """
def move_common_to_left(mylist: list[int], commons: list[int]) -> list[int] {
    common_elements = [
        x
        for x in mylist
        if (x in commons)
    ];
    uncommon_elements = [
        x
        for x in mylist
        if (x not in commons)
    ];
    return (common_elements + uncommon_elements);
}

