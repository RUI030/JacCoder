"""
    Takes a list of integers and returns a list containing squares of the even integers in the same order.
    """
def square_evens(nums: list[int]) -> list[int] {
    return [
        (x ** 2)
        for x in nums
        if ((x % 2) == 0)
    ];
}

