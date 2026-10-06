"""
    Returns the product of all the elements in the list.

    :param lst: List of integers
    :return: Integer product of all elements
    """
def product_of_list(lst: list[int]) -> int {
    product = 1;
    for num in lst {
        product *= num;
    }
    return product;
}

