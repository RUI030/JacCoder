"""
    This function calculates the maximum number of flower beds that can be fully occupied with flowers
    given the compatibility values of the soils.

    n: int - number of different types of flowers
    m: int - number of flower beds
    compat_values: list of int - compatibility values of the soils

    return: int - maximum number of fully occupied flower beds
    """
def max_full_flower_beds(n: int, m: int, compat_values: list[int]) -> int {
    total_possible_beds = sum(compat_values);
    return min(total_possible_beds, m);
}

