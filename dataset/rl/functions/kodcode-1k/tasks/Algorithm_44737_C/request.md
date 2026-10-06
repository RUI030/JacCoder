# is_schedule_valid

Determines if the student's schedule is valid without overlapping courses.

Args:
courses (List[Tuple[int, int]]): List of tuples where each tuple contains the start and end times of a course.

Returns:
bool: True if the schedule is valid (no overlaps), False otherwise

Examples:
>>> is_schedule_valid([(9, 12), (13, 15), (16, 18)])
True

>>> is_schedule_valid([(9, 12), (11, 14), (16, 18)])
False

Implement `is_schedule_valid(courses: list[tuple[int, int]]) -> bool`.
