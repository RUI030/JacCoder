"""
    Determines if it is possible to make the heights of students strictly decreasing from left to right
    by reducing any student's height by 1 unit any number of times.

    Parameters:
    - N: an integer representing the number of students
    - heights: a list of integers representing the heights of the students

    Returns:
    - 'Possible' or 'Impossible' depending on whether the sequence can be made strictly decreasing
    """
def is_strictly_decreasing_possible(N: int, heights: list[int]) -> str {
    for i in range(1, N) {
        if (heights[i] >= heights[(i - 1)]) {
            return 'Impossible';
        }
    }
    return 'Possible';
}

