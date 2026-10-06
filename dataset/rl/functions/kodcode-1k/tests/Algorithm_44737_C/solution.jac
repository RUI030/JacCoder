import from typing { Any }
import from typing { List, Tuple }
"""
    Determines if the student's schedule is valid without overlapping courses.

    Args:
    courses (List[Tuple[int, int]]): List of tuples where each tuple contains the start and end times of a course.

    Returns:
    bool: True if the schedule is valid (no overlaps), False otherwise
    """
def is_schedule_valid(courses: list[tuple[int, int]]) -> bool {
    courses.sort(key=lambda (x: Any) { x[0]; });
    for i in range(1, len(courses)) {
        if (courses[(i - 1)][1] > courses[i][0]) {
            return False;
        }
    }
    return True;
}

