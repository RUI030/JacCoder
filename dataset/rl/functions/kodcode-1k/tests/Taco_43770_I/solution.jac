"""
    Checks if it's possible to assign booths such that the total number of staff members used in each combination is unique.

    Args:
    n : int : Number of different booth types.
    staff_requirements : list : List of integers representing the number of staff members required for each booth type.

    Returns:
    str : "Possible" or "Impossible"
    """
def can_assign_booths_unique(n: int, staff_requirements: list[int]) -> str {
    staff_requirements_sorted = sorted(staff_requirements);
    for i in range(1, n) {
        if (staff_requirements_sorted[i] == staff_requirements_sorted[(i - 1)]) {
            return "Impossible";
        }
    }
    return "Possible";
}

