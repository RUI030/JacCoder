"""
    Calculate the minimum number of times the machine needs to be repaired.

    Arguments:
    m: int - number of fields
    d: int - durability of the machine (maximum number of uses before repair)
    plowing_needs: list of int - list where each value represents the number of times a field needs to be plowed

    Returns:
    int - minimum number of repairs needed
    """
def min_repairs(m: int, d: int, plowing_needs: list[int]) -> int {
    total_plows = sum(plowing_needs);
    repairs_needed = total_plows // d;
    if ((total_plows % d) == 0) {
        repairs_needed -= 1;
    }
    return repairs_needed;
}

