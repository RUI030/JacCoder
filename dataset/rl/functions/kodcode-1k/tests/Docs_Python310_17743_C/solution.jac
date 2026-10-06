"""
    Returns the name and total score of the student with the highest total score.

    :param students: List of tuples, where each tuple contains a student's name and three subject scores.
    :return: Tuple containing the name of the student with the highest total score and their total score.
    """
def top_student(students: list[tuple[str, int, int, int]]) -> tuple[str, int] {
    best_student = "";
    highest_score = 0;
    for student in students {
        (name, score1, score2, score3) = student;
        total_score = score1 + score2 + score3;
        if (total_score > highest_score) {
            highest_score = total_score;
            best_student = name;
        }
    }
    return (best_student, highest_score);
}

