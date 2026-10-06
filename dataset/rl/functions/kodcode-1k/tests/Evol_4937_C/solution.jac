import from typing { List, Tuple, Dict }
"""
    Given a list of tuples where the first element is a string representing the student's name and the second element is an integer representing the student's score,
    return a dictionary where the keys are student names and the values are the highest score obtained by that student.

    If the list is empty, return an empty dictionary.
    If a student has multiple scores, ensure only the highest score is recorded.
    """
def highest_student_scores(student_scores: list[tuple[str, int]]) -> dict[str, int] {
    highest_scores = {};
    for (name, score) in student_scores {
        if ((name not in highest_scores) or (score > highest_scores[name])) {
            highest_scores[name] = score;
        }
    }
    return highest_scores;
}

