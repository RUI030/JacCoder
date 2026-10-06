"""
    Determines if students can be rearranged in such a way that every student is taller than the preceding one.

    Parameters:
    n (int): Number of students.
    heights (list of int): List of student heights.

    Returns:
    str: "YES" if students can be rearranged to meet the requirements, otherwise "NO".
    """
def can_rearrange_students(n: int, heights: list[int]) -> str {
    unique_heights = `set(heights);
    if (len(unique_heights) != len(heights)) {
        return "NO";
    }
    return "YES";
}

