"""
    Returns the number of students eligible for an award.

    A student is eligible if they are taller than both their immediate neighbors.

    :param heights: List[int] - list of student heights
    :return: int - number of students eligible for an award
    """
def count_award_eligible_students(heights: list[int]) -> int {
    if (len(heights) < 3) {
        return 0;
    }
    eligible_count = 0;
    for i in range(1, (len(heights) - 1)) {
        if ((heights[i] > heights[(i - 1)]) and (heights[i] > heights[(i + 1)])) {
            eligible_count += 1;
        }
    }
    return eligible_count;
}

