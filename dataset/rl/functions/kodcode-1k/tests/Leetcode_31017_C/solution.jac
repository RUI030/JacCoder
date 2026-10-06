"""
    Rearrange elements in nums such that all elements less than pivot
    appear before all elements equal to pivot, and those appear before
    all elements greater than pivot.

    Parameters:
    nums (list of int): The list of integers to rearrange.
    pivot (int): The pivot integer for the rearrangement.

    Returns:
    list of int: The rearranged list.
    """
def rearrange_array(nums: list[int], pivot: int) -> list[int] {
    less_than_pivot = [
        x
        for x in nums
        if (x < pivot)
    ];
    equal_to_pivot = [
        x
        for x in nums
        if (x == pivot)
    ];
    greater_than_pivot = [
        x
        for x in nums
        if (x > pivot)
    ];
    return (less_than_pivot + equal_to_pivot + greater_than_pivot);
}

