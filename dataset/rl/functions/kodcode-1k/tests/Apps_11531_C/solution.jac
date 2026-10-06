"""
    Takes a list of integers and returns a new list where each element is squared
    but only if the element is an even number. Odd numbers remain unchanged.

    :param nums: List of integers
    :return: A new list where even numbers are squared and odd numbers remain the same
    """
def process_list(nums: list[int]) -> list[int] {
    return [(x ** 2) if ((x % 2) == 0) else x for x in nums];
}

