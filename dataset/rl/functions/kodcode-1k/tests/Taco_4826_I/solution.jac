"""
    Re-arranges the list so that all even numbers come before all odd numbers,
    both in non-decreasing order.

    Parameters:
    nums (list of int): The list of integers to re-arrange.

    Returns:
    list of int: The re-arranged list of integers.
    """
def rearrange_list(nums: list[int]) -> list[int] {
    even_nums = sorted(
        [
            num
            for num in nums
            if ((num % 2) == 0)
        ]
    );
    odd_nums = sorted(
        [
            num
            for num in nums
            if ((num % 2) != 0)
        ]
    );
    return (even_nums + odd_nums);
}
with entry {
    n = 6;
    nums = [4, 3, 1, 2, 5, 6];
    print(rearrange_list(nums));
    n = 7;
    nums = [-2, -3, 4, 1, -1, 2, 0];
    print(rearrange_list(nums));
}

