"""
    Returns the product of the maximum pair in the array.
    The array will contain at least two integers,
    and each integer is greater than or equal to 1.

    :param arr: List of integers
    :return: Product of the two largest integers in the array
    """
def maxPairProduct(arr: list[int]) -> int {
    arr.sort(reverse=True);
    return (arr[0] * arr[1]);
}

