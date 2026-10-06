"""
    Takes in a list of integers and returns a new list with all even numbers squared
    and all odd numbers doubled.

    :param nums: List[int]
    :return: List[int]
    """
def process_numbers(nums: list[int]) -> list[int] {
    return [(x ** 2) if ((x % 2) == 0) else (x * 2) for x in nums];
}

