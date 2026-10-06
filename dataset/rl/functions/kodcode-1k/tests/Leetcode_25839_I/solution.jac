"""
    Rounds grades according to the specified rules:
    1. If the difference between the grade and the next multiple of 5 is less than 3,
       round the grade up to the next multiple of 5.
    2. If the value of the grade is less than 38, no rounding occurs as the grade is failing.

    Parameters:
    grades (list of int): List of student grades

    Returns:
    list of int: List of rounded grades
    """
def round_grades(grades: list[int]) -> list[int] {
    rounded_grades = [];
    for grade in grades {
        if (grade < 38) {
            rounded_grades.append(grade);
        } else {
            diff = 5 - (grade % 5);
            if (diff < 3) {
                rounded_grades.append((grade + diff));
            } else {
                rounded_grades.append(grade);
            }
        }
    }
    return rounded_grades;
}

