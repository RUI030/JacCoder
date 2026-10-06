"""
    Normalizes grades such that the highest grade becomes 100 and others scale accordingly.

    :param n: Number of students
    :param student_grades: List of tuples containing student names and their grades
    :return: List of tuples containing student names and their normalized grades
    """
def normalize_grades(n: int, student_grades: list[tuple[str, int]]) -> list[tuple[str, float]] {
    if (n == 0) {
        return [];
    }
    max_grade = max([grade for (name, grade) in student_grades]);
    if (max_grade == 0) {
        return [(name, 0.0) for (name, grade) in student_grades];
    }
    normalized_grades = [
        (name, round(((grade / max_grade) * 100), 2))
        for (name, grade) in student_grades
    ];
    return normalized_grades;
}

